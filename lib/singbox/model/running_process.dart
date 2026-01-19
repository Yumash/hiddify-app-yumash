import 'package:freezed_annotation/freezed_annotation.dart';

part 'running_process.freezed.dart';
part 'running_process.g.dart';

@freezed
abstract class RunningProcess with _$RunningProcess {
  const factory RunningProcess({
    required String name,
    required int pid,
  }) = _RunningProcess;

  factory RunningProcess.fromJson(Map<String, dynamic> json) =>
      _$RunningProcessFromJson(json);
}
