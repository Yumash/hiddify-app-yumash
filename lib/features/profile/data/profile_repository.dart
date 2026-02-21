import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/database/app_database.dart';
import 'package:hiddify/core/http_client/dio_http_client.dart';
import 'package:hiddify/core/utils/exception_handler.dart';
import 'package:hiddify/features/config_option/data/config_option_repository.dart';
import 'package:hiddify/features/connection/model/connection_failure.dart';
import 'package:hiddify/features/profile/data/profile_data_mapper.dart';
import 'package:hiddify/features/profile/data/profile_data_source.dart';
import 'package:hiddify/features/profile/data/profile_parser.dart';
import 'package:hiddify/features/profile/data/profile_path_resolver.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';
import 'package:hiddify/features/profile/model/profile_failure.dart';
import 'package:hiddify/features/profile/model/profile_sort_enum.dart';
import 'package:hiddify/singbox/service/singbox_service.dart';
import 'package:hiddify/utils/custom_loggers.dart';
import 'package:hiddify/utils/link_parsers.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

/// Result of fetching Hiddify Manager subscription
class HiddifyFetchResult {
  final String? singboxContent;
  final String? xrayContent;
  final Map<String, List<String>> headers;

  HiddifyFetchResult({
    this.singboxContent,
    this.xrayContent,
    required this.headers,
  });

  bool get isHiddifyManager => singboxContent != null || xrayContent != null;
  bool get hasSingbox => singboxContent != null;
  bool get hasXray => xrayContent != null;
}

abstract interface class ProfileRepository {
  TaskEither<ProfileFailure, Unit> init();
  TaskEither<ProfileFailure, ProfileEntity?> getById(String id);
  Future<ProfileEntity?> getByName(String name);
  Stream<Either<ProfileFailure, ProfileEntity?>> watchActiveProfile();
  Stream<Either<ProfileFailure, bool>> watchHasAnyProfile();

  Stream<Either<ProfileFailure, List<ProfileEntity>>> watchAll({
    ProfilesSort sort = ProfilesSort.lastUpdate,
    SortMode sortMode = SortMode.ascending,
  });

  TaskEither<ProfileFailure, Unit> addByUrl(
    String url, {
    bool markAsActive = false,
    CancelToken? cancelToken,
  });
  TaskEither<ProfileFailure, Unit> updateContent(
    String profileId,
    String content,
  );
  TaskEither<ProfileFailure, Unit> addByContent(
    String content, {
    required String name,
    bool markAsActive = false,
  });

  TaskEither<ProfileFailure, Unit> add(
    RemoteProfileEntity baseProfile, {
    CancelToken? cancelToken,
  });

  TaskEither<ProfileFailure, String> generateConfig(String id);

  /// using [patchBaseProfile] name, url, etc will also be patched (useful when editing with a new url)
  TaskEither<ProfileFailure, Unit> updateSubscription(
    RemoteProfileEntity baseProfile, {
    bool patchBaseProfile = false,
    CancelToken? cancelToken,
  });

  TaskEither<ProfileFailure, Unit> patch(ProfileEntity profile);
  TaskEither<ProfileFailure, Unit> setAsActive(String id);
  TaskEither<ProfileFailure, Unit> deleteById(String id);
}

class ProfileRepositoryImpl with ExceptionHandler, InfraLogger implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.profileDataSource,
    required this.profilePathResolver,
    required this.singbox,
    required this.configOptionRepository,
    required this.httpClient,
  });

  final ProfileDataSource profileDataSource;
  final ProfilePathResolver profilePathResolver;
  final SingboxService singbox;
  final ConfigOptionRepository configOptionRepository;
  final DioHttpClient httpClient;

  /// Save debug data to debug folder for troubleshooting
  Future<void> _saveDebugData(String content, String suffix, {Map<String, List<String>>? headers}) async {
    try {
      final debugDir = profilePathResolver.debugDirectory;
      if (!await debugDir.exists()) {
        await debugDir.create(recursive: true);
      }

      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').replaceAll('.', '-');
      final debugFile = profilePathResolver.debugFile('${timestamp}_$suffix.json');
      await debugFile.writeAsString(content);
      loggy.debug("Debug data saved to: ${debugFile.path}");

      // Save headers too if provided
      if (headers != null && headers.isNotEmpty) {
        final headersFile = profilePathResolver.debugFile('${timestamp}_${suffix}_headers.json');
        await headersFile.writeAsString(json.encode(headers));
      }
    } catch (e) {
      loggy.warning("Failed to save debug data: $e");
    }
  }

  @override
  TaskEither<ProfileFailure, Unit> init() {
    return exceptionHandler(
      () async {
        if (!await profilePathResolver.directory.exists()) {
          await profilePathResolver.directory.create(recursive: true);
        }
        return right(unit);
      },
      ProfileUnexpectedFailure.new,
    );
  }

  @override
  TaskEither<ProfileFailure, ProfileEntity?> getById(String id) {
    return TaskEither.tryCatch(
      () => profileDataSource.getById(id).then((value) => value?.toEntity()),
      ProfileUnexpectedFailure.new,
    );
  }

  @override
  Future<ProfileEntity?> getByName(String name) async {
    return (await profileDataSource.getByName(name))?.toEntity();
  }

  @override
  Stream<Either<ProfileFailure, ProfileEntity?>> watchActiveProfile() {
    return profileDataSource
        .watchActiveProfile()
        .map((event) => event?.toEntity())
        // Add debounce to prevent rapid profile switching from causing race conditions
        .debounceTime(const Duration(milliseconds: 100))
        // Only emit when profile actually changes
        .distinct((prev, next) => prev?.id == next?.id)
        .handleExceptions(
          (error, stackTrace) {
            loggy.error("error watching active profile", error, stackTrace);
            return ProfileUnexpectedFailure(error, stackTrace);
          },
        );
  }

  @override
  Stream<Either<ProfileFailure, bool>> watchHasAnyProfile() {
    return profileDataSource.watchProfilesCount().map((event) => event != 0).handleExceptions(ProfileUnexpectedFailure.new);
  }

  @override
  Stream<Either<ProfileFailure, List<ProfileEntity>>> watchAll({
    ProfilesSort sort = ProfilesSort.lastUpdate,
    SortMode sortMode = SortMode.ascending,
  }) {
    return profileDataSource.watchAll(sort: sort, sortMode: sortMode).map((event) => event.map((e) => e.toEntity()).toList()).handleExceptions(ProfileUnexpectedFailure.new);
  }

  @override
  TaskEither<ProfileFailure, Unit> addByUrl(
    String url, {
    bool markAsActive = false,
    CancelToken? cancelToken,
  }) {
    return exceptionHandler(
      () async {
        final existingProfile = await profileDataSource.getByUrl(url).then((value) => value?.toEntity());
        if (existingProfile case RemoteProfileEntity()) {
          loggy.info("profile with same url already exists, updating");
          final baseProfile = markAsActive ? existingProfile.copyWith(active: true) : existingProfile;
          return updateSubscription(
            baseProfile,
            cancelToken: cancelToken,
          ).run();
        }

        final profileId = const Uuid().v4();
        return fetch(url, profileId, cancelToken: cancelToken)
            .flatMap(
              (profile) => TaskEither(
                () async {
                  await profileDataSource.insert(
                    profile.copyWith(id: profileId, active: markAsActive).toEntry(),
                  );
                  return right(unit);
                },
              ),
            )
            .run();
      },
      (error, stackTrace) {
        loggy.warning("error adding profile by url", error, stackTrace);
        return ProfileUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @visibleForTesting
  TaskEither<ProfileFailure, Unit> validateConfig(
    String path,
    String tempPath,
    bool debug,
  ) {
    return exceptionHandler(
      () async {
        singbox.changeOptions(await configOptionRepository.getConfigOptions()).run();

        return singbox.validateConfigByPath(path, tempPath, debug).mapLeft(ProfileFailure.invalidConfig).run();
      },
      ProfileUnexpectedFailure.new,
    );
  }

  @override
  TaskEither<ProfileFailure, Unit> updateContent(
    String profileId,
    String content,
  ) {
    return exceptionHandler(
      () async {
        final file = profilePathResolver.file(profileId);
        final tempFile = profilePathResolver.tempFile(profileId);

        try {
          await tempFile.writeAsString(content);
          return await validateConfig(file.path, tempFile.path, false).run();
        } finally {
          if (tempFile.existsSync()) tempFile.deleteSync();
        }
      },
      (error, stackTrace) {
        loggy.warning("error adding profile by content", error, stackTrace);
        return ProfileUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  TaskEither<ProfileFailure, Unit> addByContent(
    String content, {
    required String name,
    bool markAsActive = false,
  }) {
    return exceptionHandler(
      () async {
        final profileId = const Uuid().v4();

        return await updateContent(profileId, content)
            .andThen(
              () => TaskEither(() async {
                final profile = LocalProfileEntity(
                  id: profileId,
                  active: markAsActive,
                  name: name,
                  lastUpdate: DateTime.now(),
                );
                await profileDataSource.insert(profile.toEntry());

                return right(unit);
              }),
            )
            .run();
      },
      (error, stackTrace) {
        loggy.warning("error adding profile by content", error, stackTrace);
        return ProfileUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  TaskEither<ProfileFailure, Unit> add(
    RemoteProfileEntity baseProfile, {
    CancelToken? cancelToken,
  }) {
    return exceptionHandler(
      () {
        return fetch(baseProfile.url, baseProfile.id, cancelToken: cancelToken)
            .flatMap(
              (remoteProfile) => TaskEither(() async {
                await profileDataSource.insert(
                  baseProfile
                      .copyWith(
                        subInfo: remoteProfile.subInfo,
                        lastUpdate: DateTime.now(),
                      )
                      .toEntry(),
                );
                return right(unit);
              }),
            )
            .run();
      },
      (error, stackTrace) {
        loggy.warning("error adding profile", error, stackTrace);
        return ProfileUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  TaskEither<ProfileFailure, String> generateConfig(String id) {
    return TaskEither<ProfileFailure, String>.Do(
      ($) async {
        final configFile = profilePathResolver.file(id);

        final options = await configOptionRepository.getConfigOptions();

        singbox.changeOptions(options).mapLeft(InvalidConfigOption.new).run();

        return await $(
          singbox.generateFullConfigByPath(configFile.path).mapLeft(ProfileFailure.unexpected),
        );
      },
    ).handleExceptions(ProfileFailure.unexpected);
  }

  @override
  TaskEither<ProfileFailure, Unit> updateSubscription(
    RemoteProfileEntity baseProfile, {
    bool patchBaseProfile = false,
    CancelToken? cancelToken,
  }) {
    return exceptionHandler(
      () {
        loggy.debug(
          "updating profile [${baseProfile.name} (${baseProfile.id})]",
        );
        return fetch(baseProfile.url, baseProfile.id, cancelToken: cancelToken)
            .flatMap(
              (remoteProfile) => TaskEither(
                () async {
                  final profilePatch = remoteProfile.subInfoPatch().copyWith(lastUpdate: Value(DateTime.now()), active: Value(baseProfile.active));

                  await profileDataSource.edit(
                    baseProfile.id,
                    patchBaseProfile
                        ? profilePatch.copyWith(
                            name: Value(baseProfile.name),
                            url: Value(baseProfile.url),
                            testUrl: Value(baseProfile.testUrl),
                            updateInterval: Value(baseProfile.options?.updateInterval),
                          )
                        : profilePatch,
                  );
                  return right(unit);
                },
              ),
            )
            .run();
      },
      (error, stackTrace) {
        loggy.warning("error updating profile", error, stackTrace);
        return ProfileUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  TaskEither<ProfileFailure, Unit> patch(ProfileEntity profile) {
    return exceptionHandler(
      () async {
        loggy.debug(
          "editing profile [${profile.name} (${profile.id})]",
        );
        await profileDataSource.edit(profile.id, profile.toEntry());
        return right(unit);
      },
      (error, stackTrace) {
        loggy.warning("error editing profile", error, stackTrace);
        return ProfileUnexpectedFailure(error, stackTrace);
      },
    );
  }

  @override
  TaskEither<ProfileFailure, Unit> setAsActive(String id) {
    return TaskEither.tryCatch(
      () async {
        await profileDataSource.edit(
          id,
          const ProfileEntriesCompanion(active: Value(true)),
        );
        return unit;
      },
      ProfileUnexpectedFailure.new,
    );
  }

  @override
  TaskEither<ProfileFailure, Unit> deleteById(String id) {
    return TaskEither.tryCatch(
      () async {
        await profileDataSource.deleteById(id);
        // Delete main config file
        final mainFile = profilePathResolver.file(id);
        if (mainFile.existsSync()) {
          await mainFile.delete();
        }
        // Delete xray config file if exists
        final xrayFile = profilePathResolver.xrayFile(id);
        if (xrayFile.existsSync()) {
          await xrayFile.delete();
        }
        return unit;
      },
      ProfileUnexpectedFailure.new,
    );
  }

  static final _subInfoHeaders = [
    'profile-title',
    'content-disposition',
    'subscription-userinfo',
    'profile-update-interval',
    'support-url',
    'profile-web-page-url',
    'test-url',
  ];

  /// Try to fetch content from URL with Content-Length check
  /// Returns null if fetch fails (404, invalid content, etc.)
  Future<(String content, Map<String, List<String>> headers)?> _tryFetchEndpoint(
    String url, {
    CancelToken? cancelToken,
    String? userAgent,
  }) async {
    try {
      loggy.debug("_tryFetchEndpoint: checking $url");

      // Check Content-Length first
      final contentLength = await httpClient.checkContentLength(
        url,
        cancelToken: cancelToken,
        userAgent: userAgent,
      );
      loggy.debug("_tryFetchEndpoint: Content-Length=$contentLength for $url");

      // Download content
      final tempFile = File('${profilePathResolver.directory.path}/temp_${DateTime.now().millisecondsSinceEpoch}.tmp');
      try {
        final response = await httpClient.downloadSafe(
          url,
          tempFile.path,
          cancelToken: cancelToken,
          userAgent: userAgent,
        );

        final content = await tempFile.readAsString();
        if (content.isEmpty) {
          loggy.debug("_tryFetchEndpoint: empty content from $url");
          return null;
        }

        loggy.debug("_tryFetchEndpoint: got ${content.length} bytes from $url");
        return (content, response.headers.map);
      } finally {
        if (tempFile.existsSync()) {
          await tempFile.delete();
        }
      }
    } on DioException catch (e) {
      loggy.debug("_tryFetchEndpoint: DioException for $url: ${e.message}");
      return null;
    } catch (e) {
      loggy.debug("_tryFetchEndpoint: Exception for $url: $e");
      return null;
    }
  }

  /// Check if content is valid sing-box JSON (has outbounds array)
  bool _isValidSingboxJson(String content) {
    try {
      final data = json.decode(content.trim());
      if (data is Map<String, dynamic>) {
        final outbounds = data['outbounds'];
        return outbounds is List && outbounds.isNotEmpty;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Check if content is valid Xray JSON (has outbounds or inbounds)
  bool _isValidXrayJson(String content) {
    try {
      // Xray can return array of configs
      final data = json.decode(content.trim());
      if (data is List && data.isNotEmpty) {
        // Array of xray configs
        return true;
      }
      if (data is Map<String, dynamic>) {
        final outbounds = data['outbounds'];
        final inbounds = data['inbounds'];
        return (outbounds is List && outbounds.isNotEmpty) ||
            (inbounds is List && inbounds.isNotEmpty);
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Try to fetch as Hiddify Manager subscription (dual endpoints)
  Future<HiddifyFetchResult?> _tryFetchHiddifyManager(
    String baseUrl, {
    CancelToken? cancelToken,
  }) async {
    // Create a dedicated cancel token for Hiddify Manager detection with shorter timeout
    final hiddifyCancelToken = CancelToken();
    
    // Set timeout for Hiddify Manager detection (2 seconds instead of 15)
    Future.delayed(const Duration(seconds: 2), () {
      if (!hiddifyCancelToken.isCancelled) {
        hiddifyCancelToken.cancel('Hiddify Manager detection timeout');
        loggy.debug('_tryFetchHiddifyManager: timeout reached, falling back to regular subscription');
      }
    });
    // Normalize URL - remove trailing slash and fragment
    var normalizedUrl = baseUrl.trim();
    final fragmentIndex = normalizedUrl.indexOf('#');
    if (fragmentIndex != -1) {
      normalizedUrl = normalizedUrl.substring(0, fragmentIndex);
    }
    if (normalizedUrl.endsWith('/')) {
      normalizedUrl = normalizedUrl.substring(0, normalizedUrl.length - 1);
    }

    final singboxUrl = '$normalizedUrl/singbox';
    final xrayUrl = '$normalizedUrl/xray';

    loggy.debug("_tryFetchHiddifyManager: trying singbox=$singboxUrl, xray=$xrayUrl");

    String? singboxContent;
    String? xrayContent;
    Map<String, List<String>> headers = {};
    final List<String> errors = [];

    // Use specific User-Agents to get clean responses from Hiddify Manager:
    // - "sing-box/1.12" for /singbox: returns pure sing-box JSON without type:"xray" placeholders
    // - "Xray/25.12" for /xray: returns full Xray JSON configs including xhttp
    // Using "HiddifyNext" UA would cause server to add type:"xray" placeholders to /singbox
    // which our parser doesn't handle correctly (expects "link" field, server sends "xray_outbound_raw")
    const singboxUserAgent = "sing-box/1.12";
    const xrayUserAgent = "Xray/25.12";

    // Fetch both endpoints in parallel for better performance
    final results = await Future.wait([
      _tryFetchEndpoint(singboxUrl, cancelToken: hiddifyCancelToken, userAgent: singboxUserAgent)
          .then((result) => ('singbox', result))
          .catchError((e) {
        errors.add('singbox: $e');
        return ('singbox', null);
      }),
      _tryFetchEndpoint(xrayUrl, cancelToken: hiddifyCancelToken, userAgent: xrayUserAgent)
          .then((result) => ('xray', result))
          .catchError((e) {
        errors.add('xray: $e');
        return ('xray', null);
      }),
    ]);

    // Process results
    for (final (type, result) in results) {
      if (result == null) continue;
      final (content, respHeaders) = result;

      // Save raw response to debug folder
      await _saveDebugData(content, 'hiddify_${type}_raw', headers: respHeaders);

      if (type == 'singbox') {
        if (_isValidSingboxJson(content)) {
          singboxContent = content;
          headers = respHeaders;
          loggy.debug("_tryFetchHiddifyManager: valid sing-box JSON from /singbox (${content.length} bytes)");
        } else {
          loggy.debug("_tryFetchHiddifyManager: /singbox returned invalid sing-box JSON");
          errors.add('singbox: invalid JSON format');
        }
      } else if (type == 'xray') {
        if (_isValidXrayJson(content)) {
          xrayContent = content;
          if (headers.isEmpty) {
            headers = respHeaders;
          }
          loggy.debug("_tryFetchHiddifyManager: valid xray JSON from /xray (${content.length} bytes)");
        } else {
          loggy.debug("_tryFetchHiddifyManager: /xray returned invalid xray JSON");
          errors.add('xray: invalid JSON format');
        }
      }
    }

    // If at least one endpoint worked, this is Hiddify Manager
    if (singboxContent != null || xrayContent != null) {
      if (errors.isNotEmpty) {
        loggy.debug("_tryFetchHiddifyManager: partial success, errors: ${errors.join(', ')}");
      }
      return HiddifyFetchResult(
        singboxContent: singboxContent,
        xrayContent: xrayContent,
        headers: headers,
      );
    }

    if (errors.isNotEmpty) {
      loggy.debug("_tryFetchHiddifyManager: all endpoints failed: ${errors.join(', ')}");
    } else {
      loggy.debug("_tryFetchHiddifyManager: not a Hiddify Manager subscription");
    }
    return null;
  }

  /// Fetch subscription - tries Hiddify Manager first, then falls back to regular subscription
  @visibleForTesting
  TaskEither<ProfileFailure, RemoteProfileEntity> fetch(
    String url,
    String fileName, {
    CancelToken? cancelToken,
  }) {
    return TaskEither(
      () async {
        final file = profilePathResolver.file(fileName);
        final tempFile = profilePathResolver.tempFile(fileName);
        final xrayFile = profilePathResolver.xrayFile(fileName);

        try {
          loggy.debug("fetch: starting for $url");

          // First try as Hiddify Manager (dual endpoints)
          final hiddifyResult = await _tryFetchHiddifyManager(url, cancelToken: cancelToken);

          if (hiddifyResult != null && hiddifyResult.isHiddifyManager) {
            loggy.debug("fetch: detected Hiddify Manager subscription");

            // We need at least one config to proceed
            if (!hiddifyResult.hasSingbox && !hiddifyResult.hasXray) {
              return left(const ProfileFailure.unexpected(
                'Hiddify Manager returned no valid configs',
                StackTrace.empty,
              ));
            }

            // Save sing-box config if available
            if (hiddifyResult.hasSingbox) {
              await tempFile.writeAsString(hiddifyResult.singboxContent!);
              loggy.debug("fetch: saved sing-box config to temp file");

              // Validate sing-box config
              final validateResult = await validateConfig(file.path, tempFile.path, false).run();
              if (validateResult.isLeft()) {
                loggy.warning("fetch: sing-box config validation failed");
                return left(validateResult.getLeft().toNullable()!);
              }
            }

            // Save xray config if available
            if (hiddifyResult.hasXray) {
              await xrayFile.writeAsString(hiddifyResult.xrayContent!);
              loggy.debug("fetch: saved xray config to ${xrayFile.path}");

              // Store xray config info in singbox service for later use
              singbox.setXrayConfig(xrayFile.path, hiddifyResult.xrayContent!);

              // If no singbox config, try to get it from base URL (v2ray links)
              if (!hiddifyResult.hasSingbox) {
                loggy.debug("fetch: no sing-box config from /singbox, trying base URL for v2ray links");

                // Try base URL for v2ray links that ray2sing can convert to sing-box
                final baseResult = await _tryFetchEndpoint(url, cancelToken: cancelToken);
                if (baseResult != null) {
                  final (baseContent, baseHeaders) = baseResult;
                  await tempFile.writeAsString(baseContent);
                  loggy.debug("fetch: got ${baseContent.length} bytes from base URL");

                  // Validate - ray2sing will convert v2ray links to sing-box format
                  final validateResult = await validateConfig(file.path, tempFile.path, false).run();
                  if (validateResult.isRight()) {
                    loggy.debug("fetch: base URL content validated successfully");
                    final headers = await _populateHeaders({...hiddifyResult.headers, ...baseHeaders}, tempFile.path);
                    final profile = ProfileParser.parse(url, headers);
                    return right(profile);
                  } else {
                    loggy.warning("fetch: base URL content validation failed: ${validateResult.getLeft().toNullable()}");
                  }
                }

                // If base URL also failed, return error
                return left(const ProfileFailure.unexpected(
                  'Hiddify Manager: /singbox unavailable and base URL invalid',
                  StackTrace.empty,
                ));
              }
            }

            // Use tempFile path for headers if exists, otherwise use xrayFile
            final headerPath = tempFile.existsSync() ? tempFile.path : xrayFile.path;
            final headers = await _populateHeaders(hiddifyResult.headers, headerPath);
            final profile = ProfileParser.parse(url, headers);
            return right(profile);
          }

          // Fallback: try as regular subscription (base64 V2ray links)
          loggy.debug("fetch: trying as regular subscription");

          final regularResult = await _tryFetchEndpoint(url, cancelToken: cancelToken);
          if (regularResult == null) {
            return left(const ProfileFailure.unexpected(
              'Failed to fetch subscription: no valid content',
              StackTrace.empty,
            ));
          }

          final (content, respHeaders) = regularResult;

          // Save raw response to debug folder
          await _saveDebugData(content, 'regular_subscription_raw', headers: respHeaders);

          await tempFile.writeAsString(content);

          loggy.debug("fetch: downloaded ${content.length} bytes");
          loggy.debug("fetch: first 200 chars: ${content.substring(0, content.length > 200 ? 200 : content.length)}");

          // Validate config (parser will handle base64/JSON detection)
          final validateResult = await validateConfig(file.path, tempFile.path, false).run();
          if (validateResult.isLeft()) {
            loggy.warning("fetch: config validation failed: ${validateResult.getLeft().toNullable()}");
            return left(validateResult.getLeft().toNullable()!);
          }

          final headers = await _populateHeaders(respHeaders, tempFile.path);
          final profile = ProfileParser.parse(url, headers);
          return right(profile);
        } finally {
          if (tempFile.existsSync()) tempFile.deleteSync();
        }
      },
    );
  }

  Future<Map<String, List<String>>> _populateHeaders(
    Map<String, List<String>> headers,
    String path,
  ) async {
    var headersFound = 0;
    for (final key in _subInfoHeaders) {
      if (headers.containsKey(key)) headersFound++;
    }
    if (headersFound >= 4) return headers;

    loggy.debug(
      "only [$headersFound] headers found, checking file content for possible information",
    );
    final content = await File(path).readAsString();
    final contentHeaders = parseHeadersFromContent(content);
    for (final entry in contentHeaders.entries) {
      if (!headers.keys.contains(entry.key) && entry.value.isNotEmpty) {
        headers[entry.key] = entry.value;
      }
    }

    return headers;
  }

  static Map<String, List<String>> parseHeadersFromContent(String content) {
    final headers = <String, List<String>>{};
    final content_ = safeDecodeBase64(content);
    final lines = content_.split("\n");
    final linesToProcess = lines.length < 10 ? lines.length : 10;
    for (int i = 0; i < linesToProcess; i++) {
      final line = lines[i];
      if (line.startsWith("#") || line.startsWith("//")) {
        final index = line.indexOf(':');
        if (index == -1) continue;
        final key = line.substring(0, index).replaceFirst(RegExp("^#|//"), "").trim().toLowerCase();
        final value = line.substring(index + 1).trim();
        if (!headers.keys.contains(key) && _subInfoHeaders.contains(key) && value.isNotEmpty) {
          headers[key] = [value];
        }
      }
    }
    return headers;
  }
}
