import 'package:freezed_annotation/freezed_annotation.dart';

part 'wireguard_keys.freezed.dart';
part 'wireguard_keys.g.dart';

@freezed
abstract class WireGuardKeys with _$WireGuardKeys {
  const factory WireGuardKeys({
    required String serverPrivateKey,
    required String serverPublicKey,
    required String clientPrivateKey,
    required String clientPublicKey,
    String? error,
  }) = _WireGuardKeys;

  factory WireGuardKeys.fromJson(Map<String, dynamic> json) =>
      _$WireGuardKeysFromJson(json);
}

@freezed
abstract class LanIPInfo with _$LanIPInfo {
  const factory LanIPInfo({
    required String lanIp,
    String? error,
  }) = _LanIPInfo;

  factory LanIPInfo.fromJson(Map<String, dynamic> json) =>
      _$LanIPInfoFromJson(json);
}
