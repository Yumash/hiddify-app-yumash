// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectionFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionFailure()';
}


}

/// @nodoc
class $ConnectionFailureCopyWith<$Res>  {
$ConnectionFailureCopyWith(ConnectionFailure _, $Res Function(ConnectionFailure) __);
}


/// Adds pattern-matching-related methods to [ConnectionFailure].
extension ConnectionFailurePatterns on ConnectionFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UnexpectedConnectionFailure value)?  unexpected,TResult Function( MissingVpnPermission value)?  missingVpnPermission,TResult Function( MissingNotificationPermission value)?  missingNotificationPermission,TResult Function( MissingPrivilege value)?  missingPrivilege,TResult Function( InvalidConfigOption value)?  invalidConfigOption,TResult Function( InvalidConfig value)?  invalidConfig,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UnexpectedConnectionFailure() when unexpected != null:
return unexpected(_that);case MissingVpnPermission() when missingVpnPermission != null:
return missingVpnPermission(_that);case MissingNotificationPermission() when missingNotificationPermission != null:
return missingNotificationPermission(_that);case MissingPrivilege() when missingPrivilege != null:
return missingPrivilege(_that);case InvalidConfigOption() when invalidConfigOption != null:
return invalidConfigOption(_that);case InvalidConfig() when invalidConfig != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UnexpectedConnectionFailure value)  unexpected,required TResult Function( MissingVpnPermission value)  missingVpnPermission,required TResult Function( MissingNotificationPermission value)  missingNotificationPermission,required TResult Function( MissingPrivilege value)  missingPrivilege,required TResult Function( InvalidConfigOption value)  invalidConfigOption,required TResult Function( InvalidConfig value)  invalidConfig,}){
final _that = this;
switch (_that) {
case UnexpectedConnectionFailure():
return unexpected(_that);case MissingVpnPermission():
return missingVpnPermission(_that);case MissingNotificationPermission():
return missingNotificationPermission(_that);case MissingPrivilege():
return missingPrivilege(_that);case InvalidConfigOption():
return invalidConfigOption(_that);case InvalidConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UnexpectedConnectionFailure value)?  unexpected,TResult? Function( MissingVpnPermission value)?  missingVpnPermission,TResult? Function( MissingNotificationPermission value)?  missingNotificationPermission,TResult? Function( MissingPrivilege value)?  missingPrivilege,TResult? Function( InvalidConfigOption value)?  invalidConfigOption,TResult? Function( InvalidConfig value)?  invalidConfig,}){
final _that = this;
switch (_that) {
case UnexpectedConnectionFailure() when unexpected != null:
return unexpected(_that);case MissingVpnPermission() when missingVpnPermission != null:
return missingVpnPermission(_that);case MissingNotificationPermission() when missingNotificationPermission != null:
return missingNotificationPermission(_that);case MissingPrivilege() when missingPrivilege != null:
return missingPrivilege(_that);case InvalidConfigOption() when invalidConfigOption != null:
return invalidConfigOption(_that);case InvalidConfig() when invalidConfig != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? error,  StackTrace? stackTrace)?  unexpected,TResult Function( String? message)?  missingVpnPermission,TResult Function( String? message)?  missingNotificationPermission,TResult Function()?  missingPrivilege,TResult Function( String? message)?  invalidConfigOption,TResult Function( String? message)?  invalidConfig,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UnexpectedConnectionFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case MissingVpnPermission() when missingVpnPermission != null:
return missingVpnPermission(_that.message);case MissingNotificationPermission() when missingNotificationPermission != null:
return missingNotificationPermission(_that.message);case MissingPrivilege() when missingPrivilege != null:
return missingPrivilege();case InvalidConfigOption() when invalidConfigOption != null:
return invalidConfigOption(_that.message);case InvalidConfig() when invalidConfig != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? error,  StackTrace? stackTrace)  unexpected,required TResult Function( String? message)  missingVpnPermission,required TResult Function( String? message)  missingNotificationPermission,required TResult Function()  missingPrivilege,required TResult Function( String? message)  invalidConfigOption,required TResult Function( String? message)  invalidConfig,}) {final _that = this;
switch (_that) {
case UnexpectedConnectionFailure():
return unexpected(_that.error,_that.stackTrace);case MissingVpnPermission():
return missingVpnPermission(_that.message);case MissingNotificationPermission():
return missingNotificationPermission(_that.message);case MissingPrivilege():
return missingPrivilege();case InvalidConfigOption():
return invalidConfigOption(_that.message);case InvalidConfig():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? error,  StackTrace? stackTrace)?  unexpected,TResult? Function( String? message)?  missingVpnPermission,TResult? Function( String? message)?  missingNotificationPermission,TResult? Function()?  missingPrivilege,TResult? Function( String? message)?  invalidConfigOption,TResult? Function( String? message)?  invalidConfig,}) {final _that = this;
switch (_that) {
case UnexpectedConnectionFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case MissingVpnPermission() when missingVpnPermission != null:
return missingVpnPermission(_that.message);case MissingNotificationPermission() when missingNotificationPermission != null:
return missingNotificationPermission(_that.message);case MissingPrivilege() when missingPrivilege != null:
return missingPrivilege();case InvalidConfigOption() when invalidConfigOption != null:
return invalidConfigOption(_that.message);case InvalidConfig() when invalidConfig != null:
return invalidConfig(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UnexpectedConnectionFailure extends ConnectionFailure with UnexpectedFailure {
  const UnexpectedConnectionFailure([this.error, this.stackTrace]): super._();
  

 final  Object? error;
 final  StackTrace? stackTrace;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedConnectionFailureCopyWith<UnexpectedConnectionFailure> get copyWith => _$UnexpectedConnectionFailureCopyWithImpl<UnexpectedConnectionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedConnectionFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ConnectionFailure.unexpected(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnexpectedConnectionFailureCopyWith<$Res> implements $ConnectionFailureCopyWith<$Res> {
  factory $UnexpectedConnectionFailureCopyWith(UnexpectedConnectionFailure value, $Res Function(UnexpectedConnectionFailure) _then) = _$UnexpectedConnectionFailureCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnexpectedConnectionFailureCopyWithImpl<$Res>
    implements $UnexpectedConnectionFailureCopyWith<$Res> {
  _$UnexpectedConnectionFailureCopyWithImpl(this._self, this._then);

  final UnexpectedConnectionFailure _self;
  final $Res Function(UnexpectedConnectionFailure) _then;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(UnexpectedConnectionFailure(
freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class MissingVpnPermission extends ConnectionFailure with ExpectedMeasuredFailure {
  const MissingVpnPermission([this.message]): super._();
  

 final  String? message;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MissingVpnPermissionCopyWith<MissingVpnPermission> get copyWith => _$MissingVpnPermissionCopyWithImpl<MissingVpnPermission>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingVpnPermission&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConnectionFailure.missingVpnPermission(message: $message)';
}


}

/// @nodoc
abstract mixin class $MissingVpnPermissionCopyWith<$Res> implements $ConnectionFailureCopyWith<$Res> {
  factory $MissingVpnPermissionCopyWith(MissingVpnPermission value, $Res Function(MissingVpnPermission) _then) = _$MissingVpnPermissionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$MissingVpnPermissionCopyWithImpl<$Res>
    implements $MissingVpnPermissionCopyWith<$Res> {
  _$MissingVpnPermissionCopyWithImpl(this._self, this._then);

  final MissingVpnPermission _self;
  final $Res Function(MissingVpnPermission) _then;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(MissingVpnPermission(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class MissingNotificationPermission extends ConnectionFailure with ExpectedMeasuredFailure {
  const MissingNotificationPermission([this.message]): super._();
  

 final  String? message;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MissingNotificationPermissionCopyWith<MissingNotificationPermission> get copyWith => _$MissingNotificationPermissionCopyWithImpl<MissingNotificationPermission>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingNotificationPermission&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConnectionFailure.missingNotificationPermission(message: $message)';
}


}

/// @nodoc
abstract mixin class $MissingNotificationPermissionCopyWith<$Res> implements $ConnectionFailureCopyWith<$Res> {
  factory $MissingNotificationPermissionCopyWith(MissingNotificationPermission value, $Res Function(MissingNotificationPermission) _then) = _$MissingNotificationPermissionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$MissingNotificationPermissionCopyWithImpl<$Res>
    implements $MissingNotificationPermissionCopyWith<$Res> {
  _$MissingNotificationPermissionCopyWithImpl(this._self, this._then);

  final MissingNotificationPermission _self;
  final $Res Function(MissingNotificationPermission) _then;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(MissingNotificationPermission(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class MissingPrivilege extends ConnectionFailure with ExpectedMeasuredFailure {
  const MissingPrivilege(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingPrivilege);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionFailure.missingPrivilege()';
}


}




/// @nodoc


class InvalidConfigOption extends ConnectionFailure with ExpectedMeasuredFailure {
  const InvalidConfigOption([this.message]): super._();
  

 final  String? message;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidConfigOptionCopyWith<InvalidConfigOption> get copyWith => _$InvalidConfigOptionCopyWithImpl<InvalidConfigOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidConfigOption&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConnectionFailure.invalidConfigOption(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidConfigOptionCopyWith<$Res> implements $ConnectionFailureCopyWith<$Res> {
  factory $InvalidConfigOptionCopyWith(InvalidConfigOption value, $Res Function(InvalidConfigOption) _then) = _$InvalidConfigOptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$InvalidConfigOptionCopyWithImpl<$Res>
    implements $InvalidConfigOptionCopyWith<$Res> {
  _$InvalidConfigOptionCopyWithImpl(this._self, this._then);

  final InvalidConfigOption _self;
  final $Res Function(InvalidConfigOption) _then;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(InvalidConfigOption(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class InvalidConfig extends ConnectionFailure with ExpectedMeasuredFailure {
  const InvalidConfig([this.message]): super._();
  

 final  String? message;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidConfigCopyWith<InvalidConfig> get copyWith => _$InvalidConfigCopyWithImpl<InvalidConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidConfig&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConnectionFailure.invalidConfig(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidConfigCopyWith<$Res> implements $ConnectionFailureCopyWith<$Res> {
  factory $InvalidConfigCopyWith(InvalidConfig value, $Res Function(InvalidConfig) _then) = _$InvalidConfigCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$InvalidConfigCopyWithImpl<$Res>
    implements $InvalidConfigCopyWith<$Res> {
  _$InvalidConfigCopyWithImpl(this._self, this._then);

  final InvalidConfig _self;
  final $Res Function(InvalidConfig) _then;

/// Create a copy of ConnectionFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(InvalidConfig(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
