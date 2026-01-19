import 'package:hiddify/core/preferences/general_preferences.dart';
import 'package:hiddify/features/connection/data/connection_data_providers.dart';
import 'package:hiddify/features/connection/data/connection_repository.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';
import 'package:hiddify/features/profile/notifier/active_profile_notifier.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'connection_notifier.g.dart';

@Riverpod(keepAlive: true)
class ConnectionNotifier extends _$ConnectionNotifier with AppLogger {
  @override
  Stream<ConnectionStatus> build() async* {
    ref.listen(
      activeProfileProvider.select((value) => value.asData?.value),
      (previous, next) async {
        // Only skip if next is null (no profile selected)
        // Don't skip when previous is null - this handles initial profile selection
        if (next == null) {
          // Profile was deleted or deselected while connected
          await reconnect(null);
          return;
        }

        // Reconnect if profile changed (handles both initial selection and switching)
        final profileChanged = previous == null || previous.id != next.id;
        if (profileChanged) {
          await reconnect(next);
        }
      },
    );
    yield* _connectionRepo.watchConnectionStatus().doOnData((event) {
      if (event case Disconnected(connectionFailure: final _?) when PlatformUtils.isDesktop) {
        ref.read(Preferences.startedByUser.notifier).update(false);
      }
      loggy.info("connection status: ${event.format()}");
    });
  }

  ConnectionRepository get _connectionRepo => ref.read(connectionRepositoryProvider);

  Future<void> mayConnect() async {
    if (state case AsyncData(:final value)) {
      if (value case Disconnected()) return _connect();
    }
  }

  Future<void> toggleConnection() async {
    if (state case AsyncError()) {
      await _connect();
    } else if (state case AsyncData(:final value)) {
      switch (value) {
        case Disconnected():
          await ref.read(Preferences.startedByUser.notifier).update(true);
          await _connect();
        case Connected():
          await ref.read(Preferences.startedByUser.notifier).update(false);
          await _disconnect();
        default:
          loggy.warning("switching status, debounce");
      }
    }
  }

  Future<void> reconnect(ProfileEntity? profile) async {
    if (state case AsyncData(:final value) when value == const Connected()) {
      if (profile == null) {
        loggy.info("no active profile, disconnecting");
        return _disconnect();
      }
      loggy.info("active profile changed, reconnecting");
      await ref.read(Preferences.startedByUser.notifier).update(true);
      await _connectionRepo
          .reconnect(
        profile.id,
        profile.name,
        ref.read(Preferences.disableMemoryLimit),
        profile.testUrl,
      )
          .mapLeft((err) async {
        loggy.warning("error reconnecting", err);
        // Disconnect to clean up any partial connection state
        await _disconnect();
        state = AsyncError(err, StackTrace.current);
      }).run();
    }
  }

  Future<void> abortConnection() async {
    if (state case AsyncData(:final value)) {
      switch (value) {
        case Connected() || Connecting():
          loggy.debug("aborting connection");
          await _disconnect();
        default:
      }
    }
  }

  Future<void> _connect() async {
    final activeProfile = await ref.read(activeProfileProvider.future);
    if (activeProfile == null) {
      loggy.info("no active profile, not connecting");
      return;
    }
    await _connectionRepo
        .connect(
      activeProfile.id,
      activeProfile.name,
      ref.read(Preferences.disableMemoryLimit),
      activeProfile.testUrl,
    )
        .mapLeft((err) async {
      loggy.warning("error connecting", err);
      //Go err is not normal object to see the go errors are string and need to be dumped
      loggy.warning(err);
      if (err.toString().contains("panic")) {
        loggy.error("Panic detected in connection error: $err");
      }
      await ref.read(Preferences.startedByUser.notifier).update(false);
      state = AsyncError(err, StackTrace.current);
    }).run();
  }

  Future<void> _disconnect() async {
    await _connectionRepo.disconnect().mapLeft((err) {
      loggy.warning("error disconnecting", err);
      state = AsyncError(err, StackTrace.current);
    }).run();
  }
}

final _serviceRunningLogger = Loggy('serviceRunningProvider');

@Riverpod(keepAlive: true)
Future<bool> serviceRunning(Ref ref) async {
  _serviceRunningLogger.debug("serviceRunning: checking connection state...");
  // First, try to get current state synchronously (immediate check)
  final currentState = ref.watch(connectionProvider);
  _serviceRunningLogger.debug("serviceRunning: currentState=$currentState");
  if (currentState case AsyncData(:final value)) {
    _serviceRunningLogger.debug("serviceRunning: AsyncData, isConnected=${value.isConnected}");
    return value.isConnected;
  }
  if (currentState case AsyncError()) {
    _serviceRunningLogger.debug("serviceRunning: AsyncError, returning false");
    return false;
  }

  // If still loading, wait with timeout to prevent infinite waiting
  _serviceRunningLogger.debug("serviceRunning: still loading, waiting with timeout...");
  try {
    final result = await ref
        .watch(connectionProvider.selectAsync((data) => data.isConnected))
        .timeout(const Duration(seconds: 2));
    _serviceRunningLogger.debug("serviceRunning: got result=$result");
    return result;
  } catch (e) {
    // On any error (including timeout), assume service is not running
    _serviceRunningLogger.debug("serviceRunning: error/timeout, returning false: $e");
    return false;
  }
}
