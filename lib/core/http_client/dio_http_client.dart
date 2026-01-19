import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:hiddify/utils/custom_loggers.dart';

class DioHttpClient with InfraLogger {
  final Map<String, Dio> _dio = {};
  DioHttpClient({
    required Duration timeout,
    required String userAgent,
    required bool debug,
  }) {
    for (final mode in ["proxy", "direct", "both"]) {
      _dio[mode] = Dio(
        BaseOptions(
          connectTimeout: timeout,
          sendTimeout: timeout,
          receiveTimeout: timeout,
          headers: {"User-Agent": userAgent},
        ),
      );
      _dio[mode]!.interceptors.add(
            RetryInterceptor(
              dio: _dio[mode]!,
              retryDelays: [
                const Duration(seconds: 1),
                if (mode != "proxy") ...[
                  const Duration(seconds: 2),
                  const Duration(seconds: 3),
                ],
              ],
            ),
          );

      _dio[mode]!.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (url) {
            if (mode == "proxy") {
              return "PROXY localhost:$port";
            } else if (mode == "direct") {
              return "DIRECT";
            } else {
              return "PROXY localhost:$port; DIRECT";
            }
          };
          return client;
        },
      );
    }

    if (debug) {
      // _dio.interceptors.add(LoggyDioInterceptor(requestHeader: true));
    }
  }

  int port = 0;

  Future<bool> isPortOpen(String host, int port, {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final socket = await Socket.connect(host, port, timeout: timeout);
      await socket.close();
      return true;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  void setProxyPort(int port) {
    this.port = port;
    loggy.debug("setting proxy port: [$port]");
  }

  Future<Response<T>> get<T>(
    String url, {
    CancelToken? cancelToken,
    String? userAgent,
    ({String username, String password})? credentials,
    bool proxyOnly = false,
  }) async {
    final mode = proxyOnly
        ? "proxy"
        : await isPortOpen("127.0.0.1", port)
            ? "both"
            : "direct";
    final dio = _dio[mode]!;

    return dio.get<T>(
      url,
      cancelToken: cancelToken,
      options: _options(url, userAgent: userAgent, credentials: credentials),
    );
  }

  /// Maximum allowed content length for subscription downloads (100KB)
  static const int maxContentLength = 100 * 1024;

  /// Check Content-Length before downloading
  /// Returns content length if valid, throws if invalid or too large
  Future<int> checkContentLength(
    String url, {
    CancelToken? cancelToken,
    String? userAgent,
    ({String username, String password})? credentials,
    bool proxyOnly = false,
  }) async {
    final mode = proxyOnly
        ? "proxy"
        : await isPortOpen("127.0.0.1", port)
            ? "both"
            : "direct";
    final dio = _dio[mode]!;

    final response = await dio.head(
      url,
      cancelToken: cancelToken,
      options: _options(url, userAgent: userAgent, credentials: credentials),
    );

    final contentLengthHeader = response.headers.value('content-length');
    if (contentLengthHeader == null) {
      // No Content-Length header, allow but with caution
      loggy.warning("No Content-Length header for $url, proceeding with caution");
      return -1; // Unknown length
    }

    final contentLength = int.tryParse(contentLengthHeader) ?? 0;
    if (contentLength == 0) {
      // Content-Length: 0 often happens with dynamic content servers (like Hiddify Manager)
      // that don't know the size until they generate the response
      loggy.warning("Content-Length is 0 for $url (likely dynamic content), proceeding with caution");
      return -1; // Unknown length, proceed without size limit
    }

    if (contentLength > maxContentLength) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Content-Length ($contentLength) exceeds maximum allowed ($maxContentLength)',
      );
    }

    loggy.debug("Content-Length for $url: $contentLength bytes");
    return contentLength;
  }

  /// Safe download with Content-Length check
  Future<Response> downloadSafe(
    String url,
    String path, {
    CancelToken? cancelToken,
    String? userAgent,
    ({String username, String password})? credentials,
    bool proxyOnly = false,
  }) async {
    // First check Content-Length
    final contentLength = await checkContentLength(
      url,
      cancelToken: cancelToken,
      userAgent: userAgent,
      credentials: credentials,
      proxyOnly: proxyOnly,
    );

    final mode = proxyOnly
        ? "proxy"
        : await isPortOpen("127.0.0.1", port)
            ? "both"
            : "direct";
    final dio = _dio[mode]!;

    // Download with size limit
    return dio.download(
      url,
      path,
      cancelToken: cancelToken,
      options: _options(
        url,
        userAgent: userAgent,
        credentials: credentials,
      ),
      onReceiveProgress: (received, total) {
        // Abort if received more than expected (protection against Content-Length spoofing)
        if (contentLength > 0 && received > contentLength * 1.1) {
          cancelToken?.cancel('Received data exceeds Content-Length');
        }
        if (received > maxContentLength) {
          cancelToken?.cancel('Download exceeds maximum allowed size');
        }
      },
    );
  }

  Future<Response> download(
    String url,
    String path, {
    CancelToken? cancelToken,
    String? userAgent,
    ({String username, String password})? credentials,
    bool proxyOnly = false,
  }) async {
    final mode = proxyOnly
        ? "proxy"
        : await isPortOpen("127.0.0.1", port)
            ? "both"
            : "direct";
    final dio = _dio[mode]!;
    return dio.download(
      url,
      path,
      cancelToken: cancelToken,
      options: _options(
        url,
        userAgent: userAgent,
        credentials: credentials,
      ),
    );
  }

  Options _options(
    String url, {
    String? userAgent,
    ({String username, String password})? credentials,
  }) {
    final uri = Uri.parse(url);

    String? userInfo;
    if (credentials != null) {
      userInfo = "${credentials.username}:${credentials.password}";
    } else if (uri.userInfo.isNotEmpty) {
      userInfo = uri.userInfo;
    }

    String? basicAuth;
    if (userInfo != null) {
      basicAuth = "Basic ${base64.encode(utf8.encode(userInfo))}";
    }

    return Options(
      headers: {
        if (userAgent != null) "User-Agent": userAgent,
        if (basicAuth != null) "authorization": basicAuth,
      },
    );
  }
}
