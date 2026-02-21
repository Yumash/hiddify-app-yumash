// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileFailure()';
}


}

/// @nodoc
class $ProfileFailureCopyWith<$Res>  {
$ProfileFailureCopyWith(ProfileFailure _, $Res Function(ProfileFailure) __);
}


/// Adds pattern-matching-related methods to [ProfileFailure].
extension ProfileFailurePatterns on ProfileFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileUnexpectedFailure value)?  unexpected,TResult Function( ProfileNotFoundFailure value)?  notFound,TResult Function( ProfileInvalidUrlFailure value)?  invalidUrl,TResult Function( ProfileInvalidConfigFailure value)?  invalidConfig,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileUnexpectedFailure() when unexpected != null:
return unexpected(_that);case ProfileNotFoundFailure() when notFound != null:
return notFound(_that);case ProfileInvalidUrlFailure() when invalidUrl != null:
return invalidUrl(_that);case ProfileInvalidConfigFailure() when invalidConfig != null:
return invalidConfig(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileUnexpectedFailure value)  unexpected,required TResult Function( ProfileNotFoundFailure value)  notFound,required TResult Function( ProfileInvalidUrlFailure value)  invalidUrl,required TResult Function( ProfileInvalidConfigFailure value)  invalidConfig,}){
final _that = this;
switch (_that) {
case ProfileUnexpectedFailure():
return unexpected(_that);case ProfileNotFoundFailure():
return notFound(_that);case ProfileInvalidUrlFailure():
return invalidUrl(_that);case ProfileInvalidConfigFailure():
return invalidConfig(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileUnexpectedFailure value)?  unexpected,TResult? Function( ProfileNotFoundFailure value)?  notFound,TResult? Function( ProfileInvalidUrlFailure value)?  invalidUrl,TResult? Function( ProfileInvalidConfigFailure value)?  invalidConfig,}){
final _that = this;
switch (_that) {
case ProfileUnexpectedFailure() when unexpected != null:
return unexpected(_that);case ProfileNotFoundFailure() when notFound != null:
return notFound(_that);case ProfileInvalidUrlFailure() when invalidUrl != null:
return invalidUrl(_that);case ProfileInvalidConfigFailure() when invalidConfig != null:
return invalidConfig(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? error,  StackTrace? stackTrace)?  unexpected,TResult Function()?  notFound,TResult Function()?  invalidUrl,TResult Function( String? message)?  invalidConfig,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case ProfileNotFoundFailure() when notFound != null:
return notFound();case ProfileInvalidUrlFailure() when invalidUrl != null:
return invalidUrl();case ProfileInvalidConfigFailure() when invalidConfig != null:
return invalidConfig(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? error,  StackTrace? stackTrace)  unexpected,required TResult Function()  notFound,required TResult Function()  invalidUrl,required TResult Function( String? message)  invalidConfig,}) {final _that = this;
switch (_that) {
case ProfileUnexpectedFailure():
return unexpected(_that.error,_that.stackTrace);case ProfileNotFoundFailure():
return notFound();case ProfileInvalidUrlFailure():
return invalidUrl();case ProfileInvalidConfigFailure():
return invalidConfig(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? error,  StackTrace? stackTrace)?  unexpected,TResult? Function()?  notFound,TResult? Function()?  invalidUrl,TResult? Function( String? message)?  invalidConfig,}) {final _that = this;
switch (_that) {
case ProfileUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case ProfileNotFoundFailure() when notFound != null:
return notFound();case ProfileInvalidUrlFailure() when invalidUrl != null:
return invalidUrl();case ProfileInvalidConfigFailure() when invalidConfig != null:
return invalidConfig(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProfileUnexpectedFailure extends ProfileFailure with UnexpectedFailure {
  const ProfileUnexpectedFailure([this.error, this.stackTrace]): super._();
  

 final  Object? error;
 final  StackTrace? stackTrace;

/// Create a copy of ProfileFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUnexpectedFailureCopyWith<ProfileUnexpectedFailure> get copyWith => _$ProfileUnexpectedFailureCopyWithImpl<ProfileUnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUnexpectedFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ProfileFailure.unexpected(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ProfileUnexpectedFailureCopyWith<$Res> implements $ProfileFailureCopyWith<$Res> {
  factory $ProfileUnexpectedFailureCopyWith(ProfileUnexpectedFailure value, $Res Function(ProfileUnexpectedFailure) _then) = _$ProfileUnexpectedFailureCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$ProfileUnexpectedFailureCopyWithImpl<$Res>
    implements $ProfileUnexpectedFailureCopyWith<$Res> {
  _$ProfileUnexpectedFailureCopyWithImpl(this._self, this._then);

  final ProfileUnexpectedFailure _self;
  final $Res Function(ProfileUnexpectedFailure) _then;

/// Create a copy of ProfileFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(ProfileUnexpectedFailure(
freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ProfileNotFoundFailure extends ProfileFailure {
  const ProfileNotFoundFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileNotFoundFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileFailure.notFound()';
}


}




/// @nodoc


class ProfileInvalidUrlFailure extends ProfileFailure with ExpectedFailure {
  const ProfileInvalidUrlFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInvalidUrlFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileFailure.invalidUrl()';
}


}




/// @nodoc


class ProfileInvalidConfigFailure extends ProfileFailure with ExpectedFailure {
  const ProfileInvalidConfigFailure([this.message]): super._();
  

 final  String? message;

/// Create a copy of ProfileFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileInvalidConfigFailureCopyWith<ProfileInvalidConfigFailure> get copyWith => _$ProfileInvalidConfigFailureCopyWithImpl<ProfileInvalidConfigFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInvalidConfigFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileFailure.invalidConfig(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProfileInvalidConfigFailureCopyWith<$Res> implements $ProfileFailureCopyWith<$Res> {
  factory $ProfileInvalidConfigFailureCopyWith(ProfileInvalidConfigFailure value, $Res Function(ProfileInvalidConfigFailure) _then) = _$ProfileInvalidConfigFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ProfileInvalidConfigFailureCopyWithImpl<$Res>
    implements $ProfileInvalidConfigFailureCopyWith<$Res> {
  _$ProfileInvalidConfigFailureCopyWithImpl(this._self, this._then);

  final ProfileInvalidConfigFailure _self;
  final $Res Function(ProfileInvalidConfigFailure) _then;

/// Create a copy of ProfileFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ProfileInvalidConfigFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
