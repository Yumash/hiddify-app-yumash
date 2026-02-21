// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogEntity {

 LogLevel? get level; DateTime? get time; String get message;
/// Create a copy of LogEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogEntityCopyWith<LogEntity> get copyWith => _$LogEntityCopyWithImpl<LogEntity>(this as LogEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogEntity&&(identical(other.level, level) || other.level == level)&&(identical(other.time, time) || other.time == time)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,level,time,message);

@override
String toString() {
  return 'LogEntity(level: $level, time: $time, message: $message)';
}


}

/// @nodoc
abstract mixin class $LogEntityCopyWith<$Res>  {
  factory $LogEntityCopyWith(LogEntity value, $Res Function(LogEntity) _then) = _$LogEntityCopyWithImpl;
@useResult
$Res call({
 LogLevel? level, DateTime? time, String message
});




}
/// @nodoc
class _$LogEntityCopyWithImpl<$Res>
    implements $LogEntityCopyWith<$Res> {
  _$LogEntityCopyWithImpl(this._self, this._then);

  final LogEntity _self;
  final $Res Function(LogEntity) _then;

/// Create a copy of LogEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = freezed,Object? time = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LogLevel?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogEntity].
extension LogEntityPatterns on LogEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogEntity value)  $default,){
final _that = this;
switch (_that) {
case _LogEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LogEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LogLevel? level,  DateTime? time,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogEntity() when $default != null:
return $default(_that.level,_that.time,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LogLevel? level,  DateTime? time,  String message)  $default,) {final _that = this;
switch (_that) {
case _LogEntity():
return $default(_that.level,_that.time,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LogLevel? level,  DateTime? time,  String message)?  $default,) {final _that = this;
switch (_that) {
case _LogEntity() when $default != null:
return $default(_that.level,_that.time,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _LogEntity implements LogEntity {
  const _LogEntity({this.level, this.time, required this.message});
  

@override final  LogLevel? level;
@override final  DateTime? time;
@override final  String message;

/// Create a copy of LogEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogEntityCopyWith<_LogEntity> get copyWith => __$LogEntityCopyWithImpl<_LogEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogEntity&&(identical(other.level, level) || other.level == level)&&(identical(other.time, time) || other.time == time)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,level,time,message);

@override
String toString() {
  return 'LogEntity(level: $level, time: $time, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LogEntityCopyWith<$Res> implements $LogEntityCopyWith<$Res> {
  factory _$LogEntityCopyWith(_LogEntity value, $Res Function(_LogEntity) _then) = __$LogEntityCopyWithImpl;
@override @useResult
$Res call({
 LogLevel? level, DateTime? time, String message
});




}
/// @nodoc
class __$LogEntityCopyWithImpl<$Res>
    implements _$LogEntityCopyWith<$Res> {
  __$LogEntityCopyWithImpl(this._self, this._then);

  final _LogEntity _self;
  final $Res Function(_LogEntity) _then;

/// Create a copy of LogEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = freezed,Object? time = freezed,Object? message = null,}) {
  return _then(_LogEntity(
level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LogLevel?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
