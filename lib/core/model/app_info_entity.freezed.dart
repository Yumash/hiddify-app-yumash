// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppInfoEntity implements DiagnosticableTreeMixin {

 String get name; String get version; String get buildNumber; Release get release; String get operatingSystem; String get operatingSystemVersion; Environment get environment;
/// Create a copy of AppInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoEntityCopyWith<AppInfoEntity> get copyWith => _$AppInfoEntityCopyWithImpl<AppInfoEntity>(this as AppInfoEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppInfoEntity'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('version', version))..add(DiagnosticsProperty('buildNumber', buildNumber))..add(DiagnosticsProperty('release', release))..add(DiagnosticsProperty('operatingSystem', operatingSystem))..add(DiagnosticsProperty('operatingSystemVersion', operatingSystemVersion))..add(DiagnosticsProperty('environment', environment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfoEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.release, release) || other.release == release)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem)&&(identical(other.operatingSystemVersion, operatingSystemVersion) || other.operatingSystemVersion == operatingSystemVersion)&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,name,version,buildNumber,release,operatingSystem,operatingSystemVersion,environment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppInfoEntity(name: $name, version: $version, buildNumber: $buildNumber, release: $release, operatingSystem: $operatingSystem, operatingSystemVersion: $operatingSystemVersion, environment: $environment)';
}


}

/// @nodoc
abstract mixin class $AppInfoEntityCopyWith<$Res>  {
  factory $AppInfoEntityCopyWith(AppInfoEntity value, $Res Function(AppInfoEntity) _then) = _$AppInfoEntityCopyWithImpl;
@useResult
$Res call({
 String name, String version, String buildNumber, Release release, String operatingSystem, String operatingSystemVersion, Environment environment
});




}
/// @nodoc
class _$AppInfoEntityCopyWithImpl<$Res>
    implements $AppInfoEntityCopyWith<$Res> {
  _$AppInfoEntityCopyWithImpl(this._self, this._then);

  final AppInfoEntity _self;
  final $Res Function(AppInfoEntity) _then;

/// Create a copy of AppInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? version = null,Object? buildNumber = null,Object? release = null,Object? operatingSystem = null,Object? operatingSystemVersion = null,Object? environment = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as Release,operatingSystem: null == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as String,operatingSystemVersion: null == operatingSystemVersion ? _self.operatingSystemVersion : operatingSystemVersion // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Environment,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfoEntity].
extension AppInfoEntityPatterns on AppInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String version,  String buildNumber,  Release release,  String operatingSystem,  String operatingSystemVersion,  Environment environment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfoEntity() when $default != null:
return $default(_that.name,_that.version,_that.buildNumber,_that.release,_that.operatingSystem,_that.operatingSystemVersion,_that.environment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String version,  String buildNumber,  Release release,  String operatingSystem,  String operatingSystemVersion,  Environment environment)  $default,) {final _that = this;
switch (_that) {
case _AppInfoEntity():
return $default(_that.name,_that.version,_that.buildNumber,_that.release,_that.operatingSystem,_that.operatingSystemVersion,_that.environment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String version,  String buildNumber,  Release release,  String operatingSystem,  String operatingSystemVersion,  Environment environment)?  $default,) {final _that = this;
switch (_that) {
case _AppInfoEntity() when $default != null:
return $default(_that.name,_that.version,_that.buildNumber,_that.release,_that.operatingSystem,_that.operatingSystemVersion,_that.environment);case _:
  return null;

}
}

}

/// @nodoc


class _AppInfoEntity extends AppInfoEntity with DiagnosticableTreeMixin {
  const _AppInfoEntity({required this.name, required this.version, required this.buildNumber, required this.release, required this.operatingSystem, required this.operatingSystemVersion, required this.environment}): super._();
  

@override final  String name;
@override final  String version;
@override final  String buildNumber;
@override final  Release release;
@override final  String operatingSystem;
@override final  String operatingSystemVersion;
@override final  Environment environment;

/// Create a copy of AppInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoEntityCopyWith<_AppInfoEntity> get copyWith => __$AppInfoEntityCopyWithImpl<_AppInfoEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppInfoEntity'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('version', version))..add(DiagnosticsProperty('buildNumber', buildNumber))..add(DiagnosticsProperty('release', release))..add(DiagnosticsProperty('operatingSystem', operatingSystem))..add(DiagnosticsProperty('operatingSystemVersion', operatingSystemVersion))..add(DiagnosticsProperty('environment', environment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfoEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.release, release) || other.release == release)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem)&&(identical(other.operatingSystemVersion, operatingSystemVersion) || other.operatingSystemVersion == operatingSystemVersion)&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,name,version,buildNumber,release,operatingSystem,operatingSystemVersion,environment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppInfoEntity(name: $name, version: $version, buildNumber: $buildNumber, release: $release, operatingSystem: $operatingSystem, operatingSystemVersion: $operatingSystemVersion, environment: $environment)';
}


}

/// @nodoc
abstract mixin class _$AppInfoEntityCopyWith<$Res> implements $AppInfoEntityCopyWith<$Res> {
  factory _$AppInfoEntityCopyWith(_AppInfoEntity value, $Res Function(_AppInfoEntity) _then) = __$AppInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String version, String buildNumber, Release release, String operatingSystem, String operatingSystemVersion, Environment environment
});




}
/// @nodoc
class __$AppInfoEntityCopyWithImpl<$Res>
    implements _$AppInfoEntityCopyWith<$Res> {
  __$AppInfoEntityCopyWithImpl(this._self, this._then);

  final _AppInfoEntity _self;
  final $Res Function(_AppInfoEntity) _then;

/// Create a copy of AppInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? version = null,Object? buildNumber = null,Object? release = null,Object? operatingSystem = null,Object? operatingSystemVersion = null,Object? environment = null,}) {
  return _then(_AppInfoEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as Release,operatingSystem: null == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as String,operatingSystemVersion: null == operatingSystemVersion ? _self.operatingSystemVersion : operatingSystemVersion // ignore: cast_nullable_to_non_nullable
as String,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Environment,
  ));
}


}

// dart format on
