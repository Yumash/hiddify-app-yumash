// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logs_overview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogsOverviewState {

 AsyncValue<List<LogEntity>> get logs; bool get paused; String get filter; LogLevel? get levelFilter;
/// Create a copy of LogsOverviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogsOverviewStateCopyWith<LogsOverviewState> get copyWith => _$LogsOverviewStateCopyWithImpl<LogsOverviewState>(this as LogsOverviewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogsOverviewState&&(identical(other.logs, logs) || other.logs == logs)&&(identical(other.paused, paused) || other.paused == paused)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.levelFilter, levelFilter) || other.levelFilter == levelFilter));
}


@override
int get hashCode => Object.hash(runtimeType,logs,paused,filter,levelFilter);

@override
String toString() {
  return 'LogsOverviewState(logs: $logs, paused: $paused, filter: $filter, levelFilter: $levelFilter)';
}


}

/// @nodoc
abstract mixin class $LogsOverviewStateCopyWith<$Res>  {
  factory $LogsOverviewStateCopyWith(LogsOverviewState value, $Res Function(LogsOverviewState) _then) = _$LogsOverviewStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<List<LogEntity>> logs, bool paused, String filter, LogLevel? levelFilter
});




}
/// @nodoc
class _$LogsOverviewStateCopyWithImpl<$Res>
    implements $LogsOverviewStateCopyWith<$Res> {
  _$LogsOverviewStateCopyWithImpl(this._self, this._then);

  final LogsOverviewState _self;
  final $Res Function(LogsOverviewState) _then;

/// Create a copy of LogsOverviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,Object? paused = null,Object? filter = null,Object? levelFilter = freezed,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<LogEntity>>,paused: null == paused ? _self.paused : paused // ignore: cast_nullable_to_non_nullable
as bool,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,levelFilter: freezed == levelFilter ? _self.levelFilter : levelFilter // ignore: cast_nullable_to_non_nullable
as LogLevel?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogsOverviewState].
extension LogsOverviewStatePatterns on LogsOverviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogsOverviewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogsOverviewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogsOverviewState value)  $default,){
final _that = this;
switch (_that) {
case _LogsOverviewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogsOverviewState value)?  $default,){
final _that = this;
switch (_that) {
case _LogsOverviewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncValue<List<LogEntity>> logs,  bool paused,  String filter,  LogLevel? levelFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogsOverviewState() when $default != null:
return $default(_that.logs,_that.paused,_that.filter,_that.levelFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncValue<List<LogEntity>> logs,  bool paused,  String filter,  LogLevel? levelFilter)  $default,) {final _that = this;
switch (_that) {
case _LogsOverviewState():
return $default(_that.logs,_that.paused,_that.filter,_that.levelFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncValue<List<LogEntity>> logs,  bool paused,  String filter,  LogLevel? levelFilter)?  $default,) {final _that = this;
switch (_that) {
case _LogsOverviewState() when $default != null:
return $default(_that.logs,_that.paused,_that.filter,_that.levelFilter);case _:
  return null;

}
}

}

/// @nodoc


class _LogsOverviewState extends LogsOverviewState {
  const _LogsOverviewState({this.logs = const AsyncLoading(), this.paused = false, this.filter = "", this.levelFilter}): super._();
  

@override@JsonKey() final  AsyncValue<List<LogEntity>> logs;
@override@JsonKey() final  bool paused;
@override@JsonKey() final  String filter;
@override final  LogLevel? levelFilter;

/// Create a copy of LogsOverviewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogsOverviewStateCopyWith<_LogsOverviewState> get copyWith => __$LogsOverviewStateCopyWithImpl<_LogsOverviewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogsOverviewState&&(identical(other.logs, logs) || other.logs == logs)&&(identical(other.paused, paused) || other.paused == paused)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.levelFilter, levelFilter) || other.levelFilter == levelFilter));
}


@override
int get hashCode => Object.hash(runtimeType,logs,paused,filter,levelFilter);

@override
String toString() {
  return 'LogsOverviewState(logs: $logs, paused: $paused, filter: $filter, levelFilter: $levelFilter)';
}


}

/// @nodoc
abstract mixin class _$LogsOverviewStateCopyWith<$Res> implements $LogsOverviewStateCopyWith<$Res> {
  factory _$LogsOverviewStateCopyWith(_LogsOverviewState value, $Res Function(_LogsOverviewState) _then) = __$LogsOverviewStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<List<LogEntity>> logs, bool paused, String filter, LogLevel? levelFilter
});




}
/// @nodoc
class __$LogsOverviewStateCopyWithImpl<$Res>
    implements _$LogsOverviewStateCopyWith<$Res> {
  __$LogsOverviewStateCopyWithImpl(this._self, this._then);

  final _LogsOverviewState _self;
  final $Res Function(_LogsOverviewState) _then;

/// Create a copy of LogsOverviewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,Object? paused = null,Object? filter = null,Object? levelFilter = freezed,}) {
  return _then(_LogsOverviewState(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<LogEntity>>,paused: null == paused ? _self.paused : paused // ignore: cast_nullable_to_non_nullable
as bool,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,levelFilter: freezed == levelFilter ? _self.levelFilter : levelFilter // ignore: cast_nullable_to_non_nullable
as LogLevel?,
  ));
}


}

// dart format on
