// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsFailure {

 Object? get error; StackTrace? get stackTrace;
/// Create a copy of SettingsFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsFailureCopyWith<SettingsFailure> get copyWith => _$SettingsFailureCopyWithImpl<SettingsFailure>(this as SettingsFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'SettingsFailure(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $SettingsFailureCopyWith<$Res>  {
  factory $SettingsFailureCopyWith(SettingsFailure value, $Res Function(SettingsFailure) _then) = _$SettingsFailureCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$SettingsFailureCopyWithImpl<$Res>
    implements $SettingsFailureCopyWith<$Res> {
  _$SettingsFailureCopyWithImpl(this._self, this._then);

  final SettingsFailure _self;
  final $Res Function(SettingsFailure) _then;

/// Create a copy of SettingsFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsFailure].
extension SettingsFailurePatterns on SettingsFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingsUnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingsUnexpectedFailure() when unexpected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingsUnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case SettingsUnexpectedFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingsUnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case SettingsUnexpectedFailure() when unexpected != null:
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
case SettingsUnexpectedFailure() when unexpected != null:
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
case SettingsUnexpectedFailure():
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
case SettingsUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class SettingsUnexpectedFailure extends SettingsFailure with UnexpectedFailure {
  const SettingsUnexpectedFailure([this.error, this.stackTrace]): super._();
  

@override final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of SettingsFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsUnexpectedFailureCopyWith<SettingsUnexpectedFailure> get copyWith => _$SettingsUnexpectedFailureCopyWithImpl<SettingsUnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsUnexpectedFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'SettingsFailure.unexpected(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $SettingsUnexpectedFailureCopyWith<$Res> implements $SettingsFailureCopyWith<$Res> {
  factory $SettingsUnexpectedFailureCopyWith(SettingsUnexpectedFailure value, $Res Function(SettingsUnexpectedFailure) _then) = _$SettingsUnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$SettingsUnexpectedFailureCopyWithImpl<$Res>
    implements $SettingsUnexpectedFailureCopyWith<$Res> {
  _$SettingsUnexpectedFailureCopyWithImpl(this._self, this._then);

  final SettingsUnexpectedFailure _self;
  final $Res Function(SettingsUnexpectedFailure) _then;

/// Create a copy of SettingsFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(SettingsUnexpectedFailure(
freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
