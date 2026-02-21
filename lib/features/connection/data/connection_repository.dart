import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/model/directories.dart';
import 'package:hiddify/core/utils/exception_handler.dart';
import 'package:hiddify/features/config_option/data/config_option_repository.dart';
import 'package:hiddify/features/connection/data/connection_platform_source.dart';
import 'package:hiddify/features/connection/model/connection_failure.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';

import 'package:hiddify/features/profile/data/profile_path_resolver.dart';
import 'package:hiddify/singbox/model/singbox_config_option.dart';
import 'package:hiddify/singbox/model/singbox_status.dart';
import 'package:hiddify/singbox/service/singbox_service.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:meta/meta.dart';

abstract interface class ConnectionRepository {
  SingboxConfigOption? get configOptionsSnapshot;

  TaskEither<ConnectionFailure, Unit> setup();
  Stream<ConnectionStatus> watchConnectionStatus();
  TaskEither<ConnectionFailure, Unit> connect(
    String fileName,
    String profileName,
    bool disableMemoryLimit,
    String? testUrl,
  );
  TaskEither<ConnectionFailure, Unit> disconnect();
  TaskEither<ConnectionFailure, Unit> reconnect(
    String fileName,
    String profileName,
    bool disableMemoryLimit,
    String? testUrl,
  );
}

class ConnectionRepositoryImpl with ExceptionHandler, InfraLogger implements ConnectionRepository {
  ConnectionRepositoryImpl({
    required this.directories,
    required this.singbox,
    required this.platformSource,
    required this.configOptionRepository,
    required this.profilePathResolver,
  });

  final Directories directories;
  final SingboxService singbox;
  final ConnectionPlatformSource platformSource;
  final ConfigOptionRepository configOptionRepository;
  final ProfilePathResolver profilePathResolver;

  SingboxConfigOption? _configOptionsSnapshot;
  @override
  SingboxConfigOption? get configOptionsSnapshot => _configOptionsSnapshot;

  bool _initialized = false;

  @override
  Stream<ConnectionStatus> watchConnectionStatus() {
    return singbox.watchStatus().map(
          (event) => switch (event) {
            SingboxStopped(:final alert?, :final message) => Disconnected(
                switch (alert) {
                  SingboxAlert.emptyConfiguration => ConnectionFailure.invalidConfig(message),
                  SingboxAlert.requestNotificationPermission => ConnectionFailure.missingNotificationPermission(message),
                  SingboxAlert.requestVPNPermission => ConnectionFailure.missingVpnPermission(message),
                  SingboxAlert.startCommandServer || SingboxAlert.createService || SingboxAlert.startService => ConnectionFailure.unexpected(message),
                },
              ),
            SingboxStopped() => const Disconnected(),
            SingboxStarting() => const Connecting(),
            SingboxStarted() => const Connected(),
            SingboxStopping() => const Disconnecting(),
          },
        );
  }

  @visibleForTesting
  TaskEither<ConnectionFailure, SingboxConfigOption> getConfigOption() {
    return TaskEither<ConnectionFailure, SingboxConfigOption>.Do(
      ($) async {
        final options = await $(
          configOptionRepository.getFullSingboxConfigOption().mapLeft((l) => const InvalidConfigOption()),
        );

        return $(TaskEither.right(options));
      },
    ).handleExceptions(UnexpectedConnectionFailure.new);
  }

  @visibleForTesting
  TaskEither<ConnectionFailure, Unit> applyConfigOption(
    SingboxConfigOption options,
    String? testUrl,
  ) {
    return exceptionHandler(
      () {
        _configOptionsSnapshot = options;
        var newOptions = options;
        if (testUrl != null) {
          newOptions = options.copyWith(connectionTestUrl: testUrl);
        }
        return singbox.changeOptions(newOptions).mapLeft(InvalidConfigOption.new).run();
      },
      UnexpectedConnectionFailure.new,
    );
  }

  @override
  TaskEither<ConnectionFailure, Unit> setup() {
    if (_initialized) return TaskEither.of(unit);
    return exceptionHandler(
      () {
        loggy.debug("setting up singbox");
        return singbox
            .setup(
              directories,
              false,
            )
            .map((r) {
              _initialized = true;
              return r;
            })
            .mapLeft(UnexpectedConnectionFailure.new)
            .run();
      },
      UnexpectedConnectionFailure.new,
    );
  }

  @override
  TaskEither<ConnectionFailure, Unit> connect(
    String fileName,
    String profileName,
    bool disableMemoryLimit,
    String? testUrl,
  ) {
    return TaskEither<ConnectionFailure, Unit>.Do(
      ($) async {
        final options = await $(getConfigOption());
        loggy.info(
          "config options: ${options.format()}\nMemory Limit: ${!disableMemoryLimit}",
        );

        await $(
          TaskEither(() async {
            if (options.enableTun) {
              final hasPrivilege = await platformSource.checkPrivilege();
              if (!hasPrivilege) {
                loggy.warning("missing privileges for tun mode");
                return left(const MissingPrivilege());
              }
            }
            return right(unit);
          }),
        );
        await $(setup());
        await $(applyConfigOption(options, testUrl));
        final startResult = await $(
          singbox
              .start(
                profilePathResolver.file(fileName).path,
                profileName,
                disableMemoryLimit,
              )
              .mapLeft(UnexpectedConnectionFailure.new),
        );

        // After sing-box starts, check if selected proxy needs Xray
        await _ensureXrayForSelectedProxy();

        return startResult;
      },
    ).handleExceptions(UnexpectedConnectionFailure.new);
  }

  /// Check selected proxies and start Xray if any of them is an xray outbound
  Future<void> _ensureXrayForSelectedProxy() async {
    // Retry with exponential backoff to wait for sing-box to initialize groups
    const maxAttempts = 5;
    const baseDelay = Duration(milliseconds: 100);

    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      try {
        // Get current groups and check selected proxies
        final groups = await singbox.watchGroups().first.timeout(
          const Duration(seconds: 2),
        );

        if (groups.isEmpty) {
          if (attempt < maxAttempts - 1) {
            loggy.debug("No groups yet, retrying... (attempt ${attempt + 1}/$maxAttempts)");
            await Future.delayed(baseDelay * (attempt + 1));
            continue;
          }
          loggy.warning("No groups found after $maxAttempts attempts");
          return;
        }

        for (final group in groups) {
          if (singbox.isXrayOutbound(group.selected)) {
            loggy.info("Selected proxy '${group.selected}' is xray, starting Xray...");
            final result = await singbox.startXrayByTag(group.selected).run();
            result.fold(
              (error) {
                // Enhanced error categorization
                if (error.contains("DNS") || error.contains("resolve")) {
                  loggy.error("DNS resolution failed for Xray proxy '${group.selected}' - check hostname validity");
                } else if (error.contains("TLS") || error.contains("handshake")) {
                  loggy.error("TLS handshake failed for Xray proxy '${group.selected}' - check SNI and certificate");
                } else if (error.contains("timeout")) {
                  loggy.error("Connection timeout for Xray proxy '${group.selected}' - proxy may be offline");
                } else {
                  loggy.error("Failed to start Xray for ${group.selected}: $error");
                }
              },
              (xrayResult) {
                if (xrayResult.error != null) {
                  if (xrayResult.error!.contains("DNS") || xrayResult.error!.contains("resolve")) {
                    loggy.error("Xray DNS error: ${xrayResult.error} - check hostname validity");
                  } else if (xrayResult.error!.contains("TLS") || xrayResult.error!.contains("handshake")) {
                    loggy.error("Xray TLS error: ${xrayResult.error} - check certificate configuration");
                  } else {
                    loggy.error("Xray start error: ${xrayResult.error}");
                  }
                } else if (xrayResult.isXray) {
                  loggy.info("Xray started on port ${xrayResult.port}");
                }
              },
            );
            // Only need to start Xray once (all xray outbounds share same Xray instance)
            return;
          }
        }
        // No xray outbound selected, done
        return;
      } catch (e) {
        if (attempt < maxAttempts - 1) {
          loggy.debug("Error getting groups, retrying... (attempt ${attempt + 1}/$maxAttempts): $e");
          await Future.delayed(baseDelay * (attempt + 1));
        } else {
          loggy.warning("Error checking xray for selected proxy after $maxAttempts attempts: $e");
        }
      }
    }
  }

  @override
  TaskEither<ConnectionFailure, Unit> disconnect() {
    return TaskEither<ConnectionFailure, Unit>.Do(
      ($) async {
        final options = await $(getConfigOption());

        await $(
          TaskEither(() async {
            if (options.enableTun) {
              final hasPrivilege = await platformSource.checkPrivilege();
              if (!hasPrivilege) {
                loggy.warning("missing privileges for tun mode");
                return left(const MissingPrivilege());
              }
            }
            return right(unit);
          }),
        );
        // Stop Xray if running
        if (singbox.isXrayRunning()) {
          loggy.info("Stopping Xray on disconnect...");
          await singbox.stopXray().run();
        }

        return await $(
          singbox.stop().mapLeft(UnexpectedConnectionFailure.new),
        );
      },
    ).handleExceptions(UnexpectedConnectionFailure.new);
  }

  @override
  TaskEither<ConnectionFailure, Unit> reconnect(
    String fileName,
    String profileName,
    bool disableMemoryLimit,
    String? testUrl,
  ) {
    return TaskEither<ConnectionFailure, Unit>.Do(
      ($) async {
        final options = await $(getConfigOption());
        loggy.info(
          "config options: ${options.format()}\nMemory Limit: ${!disableMemoryLimit}",
        );

        await $(applyConfigOption(options, testUrl));
        final restartResult = await $(
          singbox
              .restart(
                profilePathResolver.file(fileName).path,
                profileName,
                disableMemoryLimit,
              )
              .mapLeft(UnexpectedConnectionFailure.new),
        );

        // After sing-box restarts, check if selected proxy needs Xray
        await _ensureXrayForSelectedProxy();

        return restartResult;
      },
    ).handleExceptions(UnexpectedConnectionFailure.new);
  }
}
