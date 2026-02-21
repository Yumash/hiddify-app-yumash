// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_process.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RunningProcess _$RunningProcessFromJson(Map<String, dynamic> json) =>
    _RunningProcess(
      name: json['name'] as String,
      pid: (json['pid'] as num).toInt(),
    );

Map<String, dynamic> _$RunningProcessToJson(_RunningProcess instance) =>
    <String, dynamic>{'name': instance.name, 'pid': instance.pid};
