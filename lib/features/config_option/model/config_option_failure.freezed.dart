// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_option_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConfigOptionFailure {

 Object? get error; StackTrace? get stackTrace;
/// Create a copy of ConfigOptionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigOptionFailureCopyWith<ConfigOptionFailure> get copyWith => _$ConfigOptionFailureCopyWithImpl<ConfigOptionFailure>(this as ConfigOptionFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigOptionFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ConfigOptionFailure(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ConfigOptionFailureCopyWith<$Res>  {
  factory $ConfigOptionFailureCopyWith(ConfigOptionFailure value, $Res Function(ConfigOptionFailure) _then) = _$ConfigOptionFailureCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$ConfigOptionFailureCopyWithImpl<$Res>
    implements $ConfigOptionFailureCopyWith<$Res> {
  _$ConfigOptionFailureCopyWithImpl(this._self, this._then);

  final ConfigOptionFailure _self;
  final $Res Function(ConfigOptionFailure) _then;

/// Create a copy of ConfigOptionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigOptionFailure].
extension ConfigOptionFailurePatterns on ConfigOptionFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConfigOptionUnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConfigOptionUnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConfigOptionUnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case ConfigOptionUnexpectedFailure():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConfigOptionUnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case ConfigOptionUnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? error,  StackTrace? stackTrace)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConfigOptionUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? error,  StackTrace? stackTrace)  unexpected,}) {final _that = this;
switch (_that) {
case ConfigOptionUnexpectedFailure():
return unexpected(_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? error,  StackTrace? stackTrace)?  unexpected,}) {final _that = this;
switch (_that) {
case ConfigOptionUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class ConfigOptionUnexpectedFailure extends ConfigOptionFailure with UnexpectedFailure {
  const ConfigOptionUnexpectedFailure([this.error, this.stackTrace]): super._();
  

@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of ConfigOptionFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigOptionUnexpectedFailureCopyWith<ConfigOptionUnexpectedFailure> get copyWith => _$ConfigOptionUnexpectedFailureCopyWithImpl<ConfigOptionUnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigOptionUnexpectedFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ConfigOptionFailure.unexpected(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ConfigOptionUnexpectedFailureCopyWith<$Res> implements $ConfigOptionFailureCopyWith<$Res> {
  factory $ConfigOptionUnexpectedFailureCopyWith(ConfigOptionUnexpectedFailure value, $Res Function(ConfigOptionUnexpectedFailure) _then) = _$ConfigOptionUnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$ConfigOptionUnexpectedFailureCopyWithImpl<$Res>
    implements $ConfigOptionUnexpectedFailureCopyWith<$Res> {
  _$ConfigOptionUnexpectedFailureCopyWithImpl(this._self, this._then);

  final ConfigOptionUnexpectedFailure _self;
  final $Res Function(ConfigOptionUnexpectedFailure) _then;

/// Create a copy of ConfigOptionFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(ConfigOptionUnexpectedFailure(
freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
