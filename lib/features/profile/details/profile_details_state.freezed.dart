// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileDetailsState {

 ProfileEntity get profile; bool get isEditing; bool get showErrorMessages; AsyncValue<void>? get save; AsyncValue<void>? get update; AsyncValue<void>? get delete; String get configContent; bool get configContentChanged;
/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDetailsStateCopyWith<ProfileDetailsState> get copyWith => _$ProfileDetailsStateCopyWithImpl<ProfileDetailsState>(this as ProfileDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetailsState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.save, save) || other.save == save)&&(identical(other.update, update) || other.update == update)&&(identical(other.delete, delete) || other.delete == delete)&&(identical(other.configContent, configContent) || other.configContent == configContent)&&(identical(other.configContentChanged, configContentChanged) || other.configContentChanged == configContentChanged));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isEditing,showErrorMessages,save,update,delete,configContent,configContentChanged);

@override
String toString() {
  return 'ProfileDetailsState(profile: $profile, isEditing: $isEditing, showErrorMessages: $showErrorMessages, save: $save, update: $update, delete: $delete, configContent: $configContent, configContentChanged: $configContentChanged)';
}


}

/// @nodoc
abstract mixin class $ProfileDetailsStateCopyWith<$Res>  {
  factory $ProfileDetailsStateCopyWith(ProfileDetailsState value, $Res Function(ProfileDetailsState) _then) = _$ProfileDetailsStateCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile, bool isEditing, bool showErrorMessages, AsyncValue<void>? save, AsyncValue<void>? update, AsyncValue<void>? delete, String configContent, bool configContentChanged
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileDetailsStateCopyWithImpl<$Res>
    implements $ProfileDetailsStateCopyWith<$Res> {
  _$ProfileDetailsStateCopyWithImpl(this._self, this._then);

  final ProfileDetailsState _self;
  final $Res Function(ProfileDetailsState) _then;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? isEditing = null,Object? showErrorMessages = null,Object? save = freezed,Object? update = freezed,Object? delete = freezed,Object? configContent = null,Object? configContentChanged = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,save: freezed == save ? _self.save : save // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,update: freezed == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,delete: freezed == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,configContent: null == configContent ? _self.configContent : configContent // ignore: cast_nullable_to_non_nullable
as String,configContentChanged: null == configContentChanged ? _self.configContentChanged : configContentChanged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileDetailsState].
extension ProfileDetailsStatePatterns on ProfileDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileEntity profile,  bool isEditing,  bool showErrorMessages,  AsyncValue<void>? save,  AsyncValue<void>? update,  AsyncValue<void>? delete,  String configContent,  bool configContentChanged)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDetailsState() when $default != null:
return $default(_that.profile,_that.isEditing,_that.showErrorMessages,_that.save,_that.update,_that.delete,_that.configContent,_that.configContentChanged);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileEntity profile,  bool isEditing,  bool showErrorMessages,  AsyncValue<void>? save,  AsyncValue<void>? update,  AsyncValue<void>? delete,  String configContent,  bool configContentChanged)  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailsState():
return $default(_that.profile,_that.isEditing,_that.showErrorMessages,_that.save,_that.update,_that.delete,_that.configContent,_that.configContentChanged);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileEntity profile,  bool isEditing,  bool showErrorMessages,  AsyncValue<void>? save,  AsyncValue<void>? update,  AsyncValue<void>? delete,  String configContent,  bool configContentChanged)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDetailsState() when $default != null:
return $default(_that.profile,_that.isEditing,_that.showErrorMessages,_that.save,_that.update,_that.delete,_that.configContent,_that.configContentChanged);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileDetailsState extends ProfileDetailsState {
  const _ProfileDetailsState({required this.profile, this.isEditing = false, this.showErrorMessages = false, this.save, this.update, this.delete, this.configContent = "", this.configContentChanged = false}): super._();
  

@override final  ProfileEntity profile;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  bool showErrorMessages;
@override final  AsyncValue<void>? save;
@override final  AsyncValue<void>? update;
@override final  AsyncValue<void>? delete;
@override@JsonKey() final  String configContent;
@override@JsonKey() final  bool configContentChanged;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDetailsStateCopyWith<_ProfileDetailsState> get copyWith => __$ProfileDetailsStateCopyWithImpl<_ProfileDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDetailsState&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.showErrorMessages, showErrorMessages) || other.showErrorMessages == showErrorMessages)&&(identical(other.save, save) || other.save == save)&&(identical(other.update, update) || other.update == update)&&(identical(other.delete, delete) || other.delete == delete)&&(identical(other.configContent, configContent) || other.configContent == configContent)&&(identical(other.configContentChanged, configContentChanged) || other.configContentChanged == configContentChanged));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isEditing,showErrorMessages,save,update,delete,configContent,configContentChanged);

@override
String toString() {
  return 'ProfileDetailsState(profile: $profile, isEditing: $isEditing, showErrorMessages: $showErrorMessages, save: $save, update: $update, delete: $delete, configContent: $configContent, configContentChanged: $configContentChanged)';
}


}

/// @nodoc
abstract mixin class _$ProfileDetailsStateCopyWith<$Res> implements $ProfileDetailsStateCopyWith<$Res> {
  factory _$ProfileDetailsStateCopyWith(_ProfileDetailsState value, $Res Function(_ProfileDetailsState) _then) = __$ProfileDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 ProfileEntity profile, bool isEditing, bool showErrorMessages, AsyncValue<void>? save, AsyncValue<void>? update, AsyncValue<void>? delete, String configContent, bool configContentChanged
});


@override $ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class __$ProfileDetailsStateCopyWithImpl<$Res>
    implements _$ProfileDetailsStateCopyWith<$Res> {
  __$ProfileDetailsStateCopyWithImpl(this._self, this._then);

  final _ProfileDetailsState _self;
  final $Res Function(_ProfileDetailsState) _then;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? isEditing = null,Object? showErrorMessages = null,Object? save = freezed,Object? update = freezed,Object? delete = freezed,Object? configContent = null,Object? configContentChanged = null,}) {
  return _then(_ProfileDetailsState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,showErrorMessages: null == showErrorMessages ? _self.showErrorMessages : showErrorMessages // ignore: cast_nullable_to_non_nullable
as bool,save: freezed == save ? _self.save : save // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,update: freezed == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,delete: freezed == delete ? _self.delete : delete // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>?,configContent: null == configContent ? _self.configContent : configContent // ignore: cast_nullable_to_non_nullable
as String,configContentChanged: null == configContentChanged ? _self.configContentChanged : configContentChanged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
