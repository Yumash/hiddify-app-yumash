// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireguard_keys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WireGuardKeys _$WireGuardKeysFromJson(Map<String, dynamic> json) =>
    _WireGuardKeys(
      serverPrivateKey: json['serverPrivateKey'] as String,
      serverPublicKey: json['serverPublicKey'] as String,
      clientPrivateKey: json['clientPrivateKey'] as String,
      clientPublicKey: json['clientPublicKey'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$WireGuardKeysToJson(_WireGuardKeys instance) =>
    <String, dynamic>{
      'serverPrivateKey': instance.serverPrivateKey,
      'serverPublicKey': instance.serverPublicKey,
      'clientPrivateKey': instance.clientPrivateKey,
      'clientPublicKey': instance.clientPublicKey,
      'error': instance.error,
    };

_LanIPInfo _$LanIPInfoFromJson(Map<String, dynamic> json) =>
    _LanIPInfo(lanIp: json['lanIp'] as String, error: json['error'] as String?);

Map<String, dynamic> _$LanIPInfoToJson(_LanIPInfo instance) =>
    <String, dynamic>{'lanIp': instance.lanIp, 'error': instance.error};
