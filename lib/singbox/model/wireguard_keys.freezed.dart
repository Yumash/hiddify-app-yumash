// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wireguard_keys.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WireGuardKeys {

 String get serverPrivateKey; String get serverPublicKey; String get clientPrivateKey; String get clientPublicKey; String? get error;
/// Create a copy of WireGuardKeys
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WireGuardKeysCopyWith<WireGuardKeys> get copyWith => _$WireGuardKeysCopyWithImpl<WireGuardKeys>(this as WireGuardKeys, _$identity);

  /// Serializes this WireGuardKeys to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WireGuardKeys&&(identical(other.serverPrivateKey, serverPrivateKey) || other.serverPrivateKey == serverPrivateKey)&&(identical(other.serverPublicKey, serverPublicKey) || other.serverPublicKey == serverPublicKey)&&(identical(other.clientPrivateKey, clientPrivateKey) || other.clientPrivateKey == clientPrivateKey)&&(identical(other.clientPublicKey, clientPublicKey) || other.clientPublicKey == clientPublicKey)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverPrivateKey,serverPublicKey,clientPrivateKey,clientPublicKey,error);

@override
String toString() {
  return 'WireGuardKeys(serverPrivateKey: $serverPrivateKey, serverPublicKey: $serverPublicKey, clientPrivateKey: $clientPrivateKey, clientPublicKey: $clientPublicKey, error: $error)';
}


}

/// @nodoc
abstract mixin class $WireGuardKeysCopyWith<$Res>  {
  factory $WireGuardKeysCopyWith(WireGuardKeys value, $Res Function(WireGuardKeys) _then) = _$WireGuardKeysCopyWithImpl;
@useResult
$Res call({
 String serverPrivateKey, String serverPublicKey, String clientPrivateKey, String clientPublicKey, String? error
});




}
/// @nodoc
class _$WireGuardKeysCopyWithImpl<$Res>
    implements $WireGuardKeysCopyWith<$Res> {
  _$WireGuardKeysCopyWithImpl(this._self, this._then);

  final WireGuardKeys _self;
  final $Res Function(WireGuardKeys) _then;

/// Create a copy of WireGuardKeys
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverPrivateKey = null,Object? serverPublicKey = null,Object? clientPrivateKey = null,Object? clientPublicKey = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
serverPrivateKey: null == serverPrivateKey ? _self.serverPrivateKey : serverPrivateKey // ignore: cast_nullable_to_non_nullable
as String,serverPublicKey: null == serverPublicKey ? _self.serverPublicKey : serverPublicKey // ignore: cast_nullable_to_non_nullable
as String,clientPrivateKey: null == clientPrivateKey ? _self.clientPrivateKey : clientPrivateKey // ignore: cast_nullable_to_non_nullable
as String,clientPublicKey: null == clientPublicKey ? _self.clientPublicKey : clientPublicKey // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WireGuardKeys].
extension WireGuardKeysPatterns on WireGuardKeys {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WireGuardKeys value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WireGuardKeys() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WireGuardKeys value)  $default,){
final _that = this;
switch (_that) {
case _WireGuardKeys():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WireGuardKeys value)?  $default,){
final _that = this;
switch (_that) {
case _WireGuardKeys() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverPrivateKey,  String serverPublicKey,  String clientPrivateKey,  String clientPublicKey,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WireGuardKeys() when $default != null:
return $default(_that.serverPrivateKey,_that.serverPublicKey,_that.clientPrivateKey,_that.clientPublicKey,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverPrivateKey,  String serverPublicKey,  String clientPrivateKey,  String clientPublicKey,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WireGuardKeys():
return $default(_that.serverPrivateKey,_that.serverPublicKey,_that.clientPrivateKey,_that.clientPublicKey,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverPrivateKey,  String serverPublicKey,  String clientPrivateKey,  String clientPublicKey,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WireGuardKeys() when $default != null:
return $default(_that.serverPrivateKey,_that.serverPublicKey,_that.clientPrivateKey,_that.clientPublicKey,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WireGuardKeys implements WireGuardKeys {
  const _WireGuardKeys({required this.serverPrivateKey, required this.serverPublicKey, required this.clientPrivateKey, required this.clientPublicKey, this.error});
  factory _WireGuardKeys.fromJson(Map<String, dynamic> json) => _$WireGuardKeysFromJson(json);

@override final  String serverPrivateKey;
@override final  String serverPublicKey;
@override final  String clientPrivateKey;
@override final  String clientPublicKey;
@override final  String? error;

/// Create a copy of WireGuardKeys
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WireGuardKeysCopyWith<_WireGuardKeys> get copyWith => __$WireGuardKeysCopyWithImpl<_WireGuardKeys>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WireGuardKeysToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WireGuardKeys&&(identical(other.serverPrivateKey, serverPrivateKey) || other.serverPrivateKey == serverPrivateKey)&&(identical(other.serverPublicKey, serverPublicKey) || other.serverPublicKey == serverPublicKey)&&(identical(other.clientPrivateKey, clientPrivateKey) || other.clientPrivateKey == clientPrivateKey)&&(identical(other.clientPublicKey, clientPublicKey) || other.clientPublicKey == clientPublicKey)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverPrivateKey,serverPublicKey,clientPrivateKey,clientPublicKey,error);

@override
String toString() {
  return 'WireGuardKeys(serverPrivateKey: $serverPrivateKey, serverPublicKey: $serverPublicKey, clientPrivateKey: $clientPrivateKey, clientPublicKey: $clientPublicKey, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WireGuardKeysCopyWith<$Res> implements $WireGuardKeysCopyWith<$Res> {
  factory _$WireGuardKeysCopyWith(_WireGuardKeys value, $Res Function(_WireGuardKeys) _then) = __$WireGuardKeysCopyWithImpl;
@override @useResult
$Res call({
 String serverPrivateKey, String serverPublicKey, String clientPrivateKey, String clientPublicKey, String? error
});




}
/// @nodoc
class __$WireGuardKeysCopyWithImpl<$Res>
    implements _$WireGuardKeysCopyWith<$Res> {
  __$WireGuardKeysCopyWithImpl(this._self, this._then);

  final _WireGuardKeys _self;
  final $Res Function(_WireGuardKeys) _then;

/// Create a copy of WireGuardKeys
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverPrivateKey = null,Object? serverPublicKey = null,Object? clientPrivateKey = null,Object? clientPublicKey = null,Object? error = freezed,}) {
  return _then(_WireGuardKeys(
serverPrivateKey: null == serverPrivateKey ? _self.serverPrivateKey : serverPrivateKey // ignore: cast_nullable_to_non_nullable
as String,serverPublicKey: null == serverPublicKey ? _self.serverPublicKey : serverPublicKey // ignore: cast_nullable_to_non_nullable
as String,clientPrivateKey: null == clientPrivateKey ? _self.clientPrivateKey : clientPrivateKey // ignore: cast_nullable_to_non_nullable
as String,clientPublicKey: null == clientPublicKey ? _self.clientPublicKey : clientPublicKey // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LanIPInfo {

 String get lanIp; String? get error;
/// Create a copy of LanIPInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanIPInfoCopyWith<LanIPInfo> get copyWith => _$LanIPInfoCopyWithImpl<LanIPInfo>(this as LanIPInfo, _$identity);

  /// Serializes this LanIPInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanIPInfo&&(identical(other.lanIp, lanIp) || other.lanIp == lanIp)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lanIp,error);

@override
String toString() {
  return 'LanIPInfo(lanIp: $lanIp, error: $error)';
}


}

/// @nodoc
abstract mixin class $LanIPInfoCopyWith<$Res>  {
  factory $LanIPInfoCopyWith(LanIPInfo value, $Res Function(LanIPInfo) _then) = _$LanIPInfoCopyWithImpl;
@useResult
$Res call({
 String lanIp, String? error
});




}
/// @nodoc
class _$LanIPInfoCopyWithImpl<$Res>
    implements $LanIPInfoCopyWith<$Res> {
  _$LanIPInfoCopyWithImpl(this._self, this._then);

  final LanIPInfo _self;
  final $Res Function(LanIPInfo) _then;

/// Create a copy of LanIPInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lanIp = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
lanIp: null == lanIp ? _self.lanIp : lanIp // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LanIPInfo].
extension LanIPInfoPatterns on LanIPInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanIPInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanIPInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanIPInfo value)  $default,){
final _that = this;
switch (_that) {
case _LanIPInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanIPInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LanIPInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lanIp,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanIPInfo() when $default != null:
return $default(_that.lanIp,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lanIp,  String? error)  $default,) {final _that = this;
switch (_that) {
case _LanIPInfo():
return $default(_that.lanIp,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lanIp,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _LanIPInfo() when $default != null:
return $default(_that.lanIp,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LanIPInfo implements LanIPInfo {
  const _LanIPInfo({required this.lanIp, this.error});
  factory _LanIPInfo.fromJson(Map<String, dynamic> json) => _$LanIPInfoFromJson(json);

@override final  String lanIp;
@override final  String? error;

/// Create a copy of LanIPInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanIPInfoCopyWith<_LanIPInfo> get copyWith => __$LanIPInfoCopyWithImpl<_LanIPInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LanIPInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanIPInfo&&(identical(other.lanIp, lanIp) || other.lanIp == lanIp)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lanIp,error);

@override
String toString() {
  return 'LanIPInfo(lanIp: $lanIp, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LanIPInfoCopyWith<$Res> implements $LanIPInfoCopyWith<$Res> {
  factory _$LanIPInfoCopyWith(_LanIPInfo value, $Res Function(_LanIPInfo) _then) = __$LanIPInfoCopyWithImpl;
@override @useResult
$Res call({
 String lanIp, String? error
});




}
/// @nodoc
class __$LanIPInfoCopyWithImpl<$Res>
    implements _$LanIPInfoCopyWith<$Res> {
  __$LanIPInfoCopyWithImpl(this._self, this._then);

  final _LanIPInfo _self;
  final $Res Function(_LanIPInfo) _then;

/// Create a copy of LanIPInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lanIp = null,Object? error = freezed,}) {
  return _then(_LanIPInfo(
lanIp: null == lanIp ? _self.lanIp : lanIp // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
