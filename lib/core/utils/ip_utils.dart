import 'package:flutter/foundation.dart';

const String fallbackObscuredAddress = "*.*.*.*";

String obscureIp(String ip) {
  try {
    if (ip.contains(".")) {
      final splits = ip.split(".");
      return "${splits.first}.*.*.${splits.last}";
    } else if (ip.contains(":")) {
      final splits = ip.split(":");
      return [
        splits.first,
        ...splits.sublist(1).map((part) => "*" * part.length),
      ].join(":");
    }
  } catch (e) {
    if (kDebugMode) debugPrint('obscureIp: Failed to obscure IP $ip: $e');
  }
  return fallbackObscuredAddress;
}
