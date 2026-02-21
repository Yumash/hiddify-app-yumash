// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'running_process.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RunningProcess {

 String get name; int get pid;
/// Create a copy of RunningProcess
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningProcessCopyWith<RunningProcess> get copyWith => _$RunningProcessCopyWithImpl<RunningProcess>(this as RunningProcess, _$identity);

  /// Serializes this RunningProcess to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningProcess&&(identical(other.name, name) || other.name == name)&&(identical(other.pid, pid) || other.pid == pid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pid);

@override
String toString() {
  return 'RunningProcess(name: $name, pid: $pid)';
}


}

/// @nodoc
abstract mixin class $RunningProcessCopyWith<$Res>  {
  factory $RunningProcessCopyWith(RunningProcess value, $Res Function(RunningProcess) _then) = _$RunningProcessCopyWithImpl;
@useResult
$Res call({
 String name, int pid
});




}
/// @nodoc
class _$RunningProcessCopyWithImpl<$Res>
    implements $RunningProcessCopyWith<$Res> {
  _$RunningProcessCopyWithImpl(this._self, this._then);

  final RunningProcess _self;
  final $Res Function(RunningProcess) _then;

/// Create a copy of RunningProcess
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pid = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RunningProcess].
extension RunningProcessPatterns on RunningProcess {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RunningProcess value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RunningProcess() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RunningProcess value)  $default,){
final _that = this;
switch (_that) {
case _RunningProcess():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RunningProcess value)?  $default,){
final _that = this;
switch (_that) {
case _RunningProcess() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int pid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RunningProcess() when $default != null:
return $default(_that.name,_that.pid);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int pid)  $default,) {final _that = this;
switch (_that) {
case _RunningProcess():
return $default(_that.name,_that.pid);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int pid)?  $default,) {final _that = this;
switch (_that) {
case _RunningProcess() when $default != null:
return $default(_that.name,_that.pid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RunningProcess implements RunningProcess {
  const _RunningProcess({required this.name, required this.pid});
  factory _RunningProcess.fromJson(Map<String, dynamic> json) => _$RunningProcessFromJson(json);

@override final  String name;
@override final  int pid;

/// Create a copy of RunningProcess
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunningProcessCopyWith<_RunningProcess> get copyWith => __$RunningProcessCopyWithImpl<_RunningProcess>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunningProcessToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunningProcess&&(identical(other.name, name) || other.name == name)&&(identical(other.pid, pid) || other.pid == pid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pid);

@override
String toString() {
  return 'RunningProcess(name: $name, pid: $pid)';
}


}

/// @nodoc
abstract mixin class _$RunningProcessCopyWith<$Res> implements $RunningProcessCopyWith<$Res> {
  factory _$RunningProcessCopyWith(_RunningProcess value, $Res Function(_RunningProcess) _then) = __$RunningProcessCopyWithImpl;
@override @useResult
$Res call({
 String name, int pid
});




}
/// @nodoc
class __$RunningProcessCopyWithImpl<$Res>
    implements _$RunningProcessCopyWith<$Res> {
  __$RunningProcessCopyWithImpl(this._self, this._then);

  final _RunningProcess _self;
  final $Res Function(_RunningProcess) _then;

/// Create a copy of RunningProcess
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pid = null,}) {
  return _then(_RunningProcess(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
