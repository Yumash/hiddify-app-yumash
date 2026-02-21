// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {

 String get id; bool get active; String get name; DateTime get lastUpdate; String? get testUrl;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.active, active) || other.active == active)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,active,name,lastUpdate,testUrl);

@override
String toString() {
  return 'ProfileEntity(id: $id, active: $active, name: $name, lastUpdate: $lastUpdate, testUrl: $testUrl)';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, bool active, String name, DateTime lastUpdate, String? testUrl
});




}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? active = null,Object? name = null,Object? lastUpdate = null,Object? testUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RemoteProfileEntity value)?  remote,TResult Function( LocalProfileEntity value)?  local,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RemoteProfileEntity() when remote != null:
return remote(_that);case LocalProfileEntity() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RemoteProfileEntity value)  remote,required TResult Function( LocalProfileEntity value)  local,}){
final _that = this;
switch (_that) {
case RemoteProfileEntity():
return remote(_that);case LocalProfileEntity():
return local(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RemoteProfileEntity value)?  remote,TResult? Function( LocalProfileEntity value)?  local,}){
final _that = this;
switch (_that) {
case RemoteProfileEntity() when remote != null:
return remote(_that);case LocalProfileEntity() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  bool active,  String name,  String url,  DateTime lastUpdate,  String? testUrl,  ProfileOptions? options,  SubscriptionInfo? subInfo)?  remote,TResult Function( String id,  bool active,  String name,  DateTime lastUpdate,  String? testUrl)?  local,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RemoteProfileEntity() when remote != null:
return remote(_that.id,_that.active,_that.name,_that.url,_that.lastUpdate,_that.testUrl,_that.options,_that.subInfo);case LocalProfileEntity() when local != null:
return local(_that.id,_that.active,_that.name,_that.lastUpdate,_that.testUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  bool active,  String name,  String url,  DateTime lastUpdate,  String? testUrl,  ProfileOptions? options,  SubscriptionInfo? subInfo)  remote,required TResult Function( String id,  bool active,  String name,  DateTime lastUpdate,  String? testUrl)  local,}) {final _that = this;
switch (_that) {
case RemoteProfileEntity():
return remote(_that.id,_that.active,_that.name,_that.url,_that.lastUpdate,_that.testUrl,_that.options,_that.subInfo);case LocalProfileEntity():
return local(_that.id,_that.active,_that.name,_that.lastUpdate,_that.testUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  bool active,  String name,  String url,  DateTime lastUpdate,  String? testUrl,  ProfileOptions? options,  SubscriptionInfo? subInfo)?  remote,TResult? Function( String id,  bool active,  String name,  DateTime lastUpdate,  String? testUrl)?  local,}) {final _that = this;
switch (_that) {
case RemoteProfileEntity() when remote != null:
return remote(_that.id,_that.active,_that.name,_that.url,_that.lastUpdate,_that.testUrl,_that.options,_that.subInfo);case LocalProfileEntity() when local != null:
return local(_that.id,_that.active,_that.name,_that.lastUpdate,_that.testUrl);case _:
  return null;

}
}

}

/// @nodoc


class RemoteProfileEntity extends ProfileEntity {
  const RemoteProfileEntity({required this.id, required this.active, required this.name, required this.url, required this.lastUpdate, this.testUrl, this.options, this.subInfo}): super._();
  

@override final  String id;
@override final  bool active;
@override final  String name;
 final  String url;
@override final  DateTime lastUpdate;
@override final  String? testUrl;
 final  ProfileOptions? options;
 final  SubscriptionInfo? subInfo;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteProfileEntityCopyWith<RemoteProfileEntity> get copyWith => _$RemoteProfileEntityCopyWithImpl<RemoteProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.active, active) || other.active == active)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl)&&(identical(other.options, options) || other.options == options)&&(identical(other.subInfo, subInfo) || other.subInfo == subInfo));
}


@override
int get hashCode => Object.hash(runtimeType,id,active,name,url,lastUpdate,testUrl,options,subInfo);

@override
String toString() {
  return 'ProfileEntity.remote(id: $id, active: $active, name: $name, url: $url, lastUpdate: $lastUpdate, testUrl: $testUrl, options: $options, subInfo: $subInfo)';
}


}

/// @nodoc
abstract mixin class $RemoteProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory $RemoteProfileEntityCopyWith(RemoteProfileEntity value, $Res Function(RemoteProfileEntity) _then) = _$RemoteProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, bool active, String name, String url, DateTime lastUpdate, String? testUrl, ProfileOptions? options, SubscriptionInfo? subInfo
});


$ProfileOptionsCopyWith<$Res>? get options;$SubscriptionInfoCopyWith<$Res>? get subInfo;

}
/// @nodoc
class _$RemoteProfileEntityCopyWithImpl<$Res>
    implements $RemoteProfileEntityCopyWith<$Res> {
  _$RemoteProfileEntityCopyWithImpl(this._self, this._then);

  final RemoteProfileEntity _self;
  final $Res Function(RemoteProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? active = null,Object? name = null,Object? url = null,Object? lastUpdate = null,Object? testUrl = freezed,Object? options = freezed,Object? subInfo = freezed,}) {
  return _then(RemoteProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as ProfileOptions?,subInfo: freezed == subInfo ? _self.subInfo : subInfo // ignore: cast_nullable_to_non_nullable
as SubscriptionInfo?,
  ));
}

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $ProfileOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionInfoCopyWith<$Res>? get subInfo {
    if (_self.subInfo == null) {
    return null;
  }

  return $SubscriptionInfoCopyWith<$Res>(_self.subInfo!, (value) {
    return _then(_self.copyWith(subInfo: value));
  });
}
}

/// @nodoc


class LocalProfileEntity extends ProfileEntity {
  const LocalProfileEntity({required this.id, required this.active, required this.name, required this.lastUpdate, this.testUrl}): super._();
  

@override final  String id;
@override final  bool active;
@override final  String name;
@override final  DateTime lastUpdate;
@override final  String? testUrl;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalProfileEntityCopyWith<LocalProfileEntity> get copyWith => _$LocalProfileEntityCopyWithImpl<LocalProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.active, active) || other.active == active)&&(identical(other.name, name) || other.name == name)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,active,name,lastUpdate,testUrl);

@override
String toString() {
  return 'ProfileEntity.local(id: $id, active: $active, name: $name, lastUpdate: $lastUpdate, testUrl: $testUrl)';
}


}

/// @nodoc
abstract mixin class $LocalProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory $LocalProfileEntityCopyWith(LocalProfileEntity value, $Res Function(LocalProfileEntity) _then) = _$LocalProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, bool active, String name, DateTime lastUpdate, String? testUrl
});




}
/// @nodoc
class _$LocalProfileEntityCopyWithImpl<$Res>
    implements $LocalProfileEntityCopyWith<$Res> {
  _$LocalProfileEntityCopyWithImpl(this._self, this._then);

  final LocalProfileEntity _self;
  final $Res Function(LocalProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? active = null,Object? name = null,Object? lastUpdate = null,Object? testUrl = freezed,}) {
  return _then(LocalProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProfileOptions {

 Duration get updateInterval;
/// Create a copy of ProfileOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileOptionsCopyWith<ProfileOptions> get copyWith => _$ProfileOptionsCopyWithImpl<ProfileOptions>(this as ProfileOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileOptions&&(identical(other.updateInterval, updateInterval) || other.updateInterval == updateInterval));
}


@override
int get hashCode => Object.hash(runtimeType,updateInterval);

@override
String toString() {
  return 'ProfileOptions(updateInterval: $updateInterval)';
}


}

/// @nodoc
abstract mixin class $ProfileOptionsCopyWith<$Res>  {
  factory $ProfileOptionsCopyWith(ProfileOptions value, $Res Function(ProfileOptions) _then) = _$ProfileOptionsCopyWithImpl;
@useResult
$Res call({
 Duration updateInterval
});




}
/// @nodoc
class _$ProfileOptionsCopyWithImpl<$Res>
    implements $ProfileOptionsCopyWith<$Res> {
  _$ProfileOptionsCopyWithImpl(this._self, this._then);

  final ProfileOptions _self;
  final $Res Function(ProfileOptions) _then;

/// Create a copy of ProfileOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updateInterval = null,}) {
  return _then(_self.copyWith(
updateInterval: null == updateInterval ? _self.updateInterval : updateInterval // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileOptions].
extension ProfileOptionsPatterns on ProfileOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileOptions value)  $default,){
final _that = this;
switch (_that) {
case _ProfileOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileOptions value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration updateInterval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileOptions() when $default != null:
return $default(_that.updateInterval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration updateInterval)  $default,) {final _that = this;
switch (_that) {
case _ProfileOptions():
return $default(_that.updateInterval);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration updateInterval)?  $default,) {final _that = this;
switch (_that) {
case _ProfileOptions() when $default != null:
return $default(_that.updateInterval);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileOptions implements ProfileOptions {
  const _ProfileOptions({required this.updateInterval});
  

@override final  Duration updateInterval;

/// Create a copy of ProfileOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileOptionsCopyWith<_ProfileOptions> get copyWith => __$ProfileOptionsCopyWithImpl<_ProfileOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileOptions&&(identical(other.updateInterval, updateInterval) || other.updateInterval == updateInterval));
}


@override
int get hashCode => Object.hash(runtimeType,updateInterval);

@override
String toString() {
  return 'ProfileOptions(updateInterval: $updateInterval)';
}


}

/// @nodoc
abstract mixin class _$ProfileOptionsCopyWith<$Res> implements $ProfileOptionsCopyWith<$Res> {
  factory _$ProfileOptionsCopyWith(_ProfileOptions value, $Res Function(_ProfileOptions) _then) = __$ProfileOptionsCopyWithImpl;
@override @useResult
$Res call({
 Duration updateInterval
});




}
/// @nodoc
class __$ProfileOptionsCopyWithImpl<$Res>
    implements _$ProfileOptionsCopyWith<$Res> {
  __$ProfileOptionsCopyWithImpl(this._self, this._then);

  final _ProfileOptions _self;
  final $Res Function(_ProfileOptions) _then;

/// Create a copy of ProfileOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updateInterval = null,}) {
  return _then(_ProfileOptions(
updateInterval: null == updateInterval ? _self.updateInterval : updateInterval // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc
mixin _$SubscriptionInfo {

 int get upload; int get download; int get total; DateTime get expire; String? get webPageUrl; String? get supportUrl;
/// Create a copy of SubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionInfoCopyWith<SubscriptionInfo> get copyWith => _$SubscriptionInfoCopyWithImpl<SubscriptionInfo>(this as SubscriptionInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionInfo&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.download, download) || other.download == download)&&(identical(other.total, total) || other.total == total)&&(identical(other.expire, expire) || other.expire == expire)&&(identical(other.webPageUrl, webPageUrl) || other.webPageUrl == webPageUrl)&&(identical(other.supportUrl, supportUrl) || other.supportUrl == supportUrl));
}


@override
int get hashCode => Object.hash(runtimeType,upload,download,total,expire,webPageUrl,supportUrl);

@override
String toString() {
  return 'SubscriptionInfo(upload: $upload, download: $download, total: $total, expire: $expire, webPageUrl: $webPageUrl, supportUrl: $supportUrl)';
}


}

/// @nodoc
abstract mixin class $SubscriptionInfoCopyWith<$Res>  {
  factory $SubscriptionInfoCopyWith(SubscriptionInfo value, $Res Function(SubscriptionInfo) _then) = _$SubscriptionInfoCopyWithImpl;
@useResult
$Res call({
 int upload, int download, int total, DateTime expire, String? webPageUrl, String? supportUrl
});




}
/// @nodoc
class _$SubscriptionInfoCopyWithImpl<$Res>
    implements $SubscriptionInfoCopyWith<$Res> {
  _$SubscriptionInfoCopyWithImpl(this._self, this._then);

  final SubscriptionInfo _self;
  final $Res Function(SubscriptionInfo) _then;

/// Create a copy of SubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upload = null,Object? download = null,Object? total = null,Object? expire = null,Object? webPageUrl = freezed,Object? supportUrl = freezed,}) {
  return _then(_self.copyWith(
upload: null == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as int,download: null == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,expire: null == expire ? _self.expire : expire // ignore: cast_nullable_to_non_nullable
as DateTime,webPageUrl: freezed == webPageUrl ? _self.webPageUrl : webPageUrl // ignore: cast_nullable_to_non_nullable
as String?,supportUrl: freezed == supportUrl ? _self.supportUrl : supportUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionInfo].
extension SubscriptionInfoPatterns on SubscriptionInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionInfo value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int upload,  int download,  int total,  DateTime expire,  String? webPageUrl,  String? supportUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionInfo() when $default != null:
return $default(_that.upload,_that.download,_that.total,_that.expire,_that.webPageUrl,_that.supportUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int upload,  int download,  int total,  DateTime expire,  String? webPageUrl,  String? supportUrl)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionInfo():
return $default(_that.upload,_that.download,_that.total,_that.expire,_that.webPageUrl,_that.supportUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int upload,  int download,  int total,  DateTime expire,  String? webPageUrl,  String? supportUrl)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionInfo() when $default != null:
return $default(_that.upload,_that.download,_that.total,_that.expire,_that.webPageUrl,_that.supportUrl);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionInfo extends SubscriptionInfo {
  const _SubscriptionInfo({required this.upload, required this.download, required this.total, required this.expire, this.webPageUrl, this.supportUrl}): super._();
  

@override final  int upload;
@override final  int download;
@override final  int total;
@override final  DateTime expire;
@override final  String? webPageUrl;
@override final  String? supportUrl;

/// Create a copy of SubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionInfoCopyWith<_SubscriptionInfo> get copyWith => __$SubscriptionInfoCopyWithImpl<_SubscriptionInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionInfo&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.download, download) || other.download == download)&&(identical(other.total, total) || other.total == total)&&(identical(other.expire, expire) || other.expire == expire)&&(identical(other.webPageUrl, webPageUrl) || other.webPageUrl == webPageUrl)&&(identical(other.supportUrl, supportUrl) || other.supportUrl == supportUrl));
}


@override
int get hashCode => Object.hash(runtimeType,upload,download,total,expire,webPageUrl,supportUrl);

@override
String toString() {
  return 'SubscriptionInfo(upload: $upload, download: $download, total: $total, expire: $expire, webPageUrl: $webPageUrl, supportUrl: $supportUrl)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionInfoCopyWith<$Res> implements $SubscriptionInfoCopyWith<$Res> {
  factory _$SubscriptionInfoCopyWith(_SubscriptionInfo value, $Res Function(_SubscriptionInfo) _then) = __$SubscriptionInfoCopyWithImpl;
@override @useResult
$Res call({
 int upload, int download, int total, DateTime expire, String? webPageUrl, String? supportUrl
});




}
/// @nodoc
class __$SubscriptionInfoCopyWithImpl<$Res>
    implements _$SubscriptionInfoCopyWith<$Res> {
  __$SubscriptionInfoCopyWithImpl(this._self, this._then);

  final _SubscriptionInfo _self;
  final $Res Function(_SubscriptionInfo) _then;

/// Create a copy of SubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upload = null,Object? download = null,Object? total = null,Object? expire = null,Object? webPageUrl = freezed,Object? supportUrl = freezed,}) {
  return _then(_SubscriptionInfo(
upload: null == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as int,download: null == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,expire: null == expire ? _self.expire : expire // ignore: cast_nullable_to_non_nullable
as DateTime,webPageUrl: freezed == webPageUrl ? _self.webPageUrl : webPageUrl // ignore: cast_nullable_to_non_nullable
as String?,supportUrl: freezed == supportUrl ? _self.supportUrl : supportUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
