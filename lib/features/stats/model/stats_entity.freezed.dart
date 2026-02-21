// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsEntity {

 int get uplink; int get downlink; int get uplinkTotal; int get downlinkTotal;
/// Create a copy of StatsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsEntityCopyWith<StatsEntity> get copyWith => _$StatsEntityCopyWithImpl<StatsEntity>(this as StatsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsEntity&&(identical(other.uplink, uplink) || other.uplink == uplink)&&(identical(other.downlink, downlink) || other.downlink == downlink)&&(identical(other.uplinkTotal, uplinkTotal) || other.uplinkTotal == uplinkTotal)&&(identical(other.downlinkTotal, downlinkTotal) || other.downlinkTotal == downlinkTotal));
}


@override
int get hashCode => Object.hash(runtimeType,uplink,downlink,uplinkTotal,downlinkTotal);

@override
String toString() {
  return 'StatsEntity(uplink: $uplink, downlink: $downlink, uplinkTotal: $uplinkTotal, downlinkTotal: $downlinkTotal)';
}


}

/// @nodoc
abstract mixin class $StatsEntityCopyWith<$Res>  {
  factory $StatsEntityCopyWith(StatsEntity value, $Res Function(StatsEntity) _then) = _$StatsEntityCopyWithImpl;
@useResult
$Res call({
 int uplink, int downlink, int uplinkTotal, int downlinkTotal
});




}
/// @nodoc
class _$StatsEntityCopyWithImpl<$Res>
    implements $StatsEntityCopyWith<$Res> {
  _$StatsEntityCopyWithImpl(this._self, this._then);

  final StatsEntity _self;
  final $Res Function(StatsEntity) _then;

/// Create a copy of StatsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uplink = null,Object? downlink = null,Object? uplinkTotal = null,Object? downlinkTotal = null,}) {
  return _then(_self.copyWith(
uplink: null == uplink ? _self.uplink : uplink // ignore: cast_nullable_to_non_nullable
as int,downlink: null == downlink ? _self.downlink : downlink // ignore: cast_nullable_to_non_nullable
as int,uplinkTotal: null == uplinkTotal ? _self.uplinkTotal : uplinkTotal // ignore: cast_nullable_to_non_nullable
as int,downlinkTotal: null == downlinkTotal ? _self.downlinkTotal : downlinkTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsEntity].
extension StatsEntityPatterns on StatsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsEntity value)  $default,){
final _that = this;
switch (_that) {
case _StatsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StatsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int uplink,  int downlink,  int uplinkTotal,  int downlinkTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsEntity() when $default != null:
return $default(_that.uplink,_that.downlink,_that.uplinkTotal,_that.downlinkTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int uplink,  int downlink,  int uplinkTotal,  int downlinkTotal)  $default,) {final _that = this;
switch (_that) {
case _StatsEntity():
return $default(_that.uplink,_that.downlink,_that.uplinkTotal,_that.downlinkTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int uplink,  int downlink,  int uplinkTotal,  int downlinkTotal)?  $default,) {final _that = this;
switch (_that) {
case _StatsEntity() when $default != null:
return $default(_that.uplink,_that.downlink,_that.uplinkTotal,_that.downlinkTotal);case _:
  return null;

}
}

}

/// @nodoc


class _StatsEntity extends StatsEntity {
  const _StatsEntity({required this.uplink, required this.downlink, required this.uplinkTotal, required this.downlinkTotal}): super._();
  

@override final  int uplink;
@override final  int downlink;
@override final  int uplinkTotal;
@override final  int downlinkTotal;

/// Create a copy of StatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsEntityCopyWith<_StatsEntity> get copyWith => __$StatsEntityCopyWithImpl<_StatsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsEntity&&(identical(other.uplink, uplink) || other.uplink == uplink)&&(identical(other.downlink, downlink) || other.downlink == downlink)&&(identical(other.uplinkTotal, uplinkTotal) || other.uplinkTotal == uplinkTotal)&&(identical(other.downlinkTotal, downlinkTotal) || other.downlinkTotal == downlinkTotal));
}


@override
int get hashCode => Object.hash(runtimeType,uplink,downlink,uplinkTotal,downlinkTotal);

@override
String toString() {
  return 'StatsEntity(uplink: $uplink, downlink: $downlink, uplinkTotal: $uplinkTotal, downlinkTotal: $downlinkTotal)';
}


}

/// @nodoc
abstract mixin class _$StatsEntityCopyWith<$Res> implements $StatsEntityCopyWith<$Res> {
  factory _$StatsEntityCopyWith(_StatsEntity value, $Res Function(_StatsEntity) _then) = __$StatsEntityCopyWithImpl;
@override @useResult
$Res call({
 int uplink, int downlink, int uplinkTotal, int downlinkTotal
});




}
/// @nodoc
class __$StatsEntityCopyWithImpl<$Res>
    implements _$StatsEntityCopyWith<$Res> {
  __$StatsEntityCopyWithImpl(this._self, this._then);

  final _StatsEntity _self;
  final $Res Function(_StatsEntity) _then;

/// Create a copy of StatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uplink = null,Object? downlink = null,Object? uplinkTotal = null,Object? downlinkTotal = null,}) {
  return _then(_StatsEntity(
uplink: null == uplink ? _self.uplink : uplink // ignore: cast_nullable_to_non_nullable
as int,downlink: null == downlink ? _self.downlink : downlink // ignore: cast_nullable_to_non_nullable
as int,uplinkTotal: null == uplinkTotal ? _self.uplinkTotal : uplinkTotal // ignore: cast_nullable_to_non_nullable
as int,downlinkTotal: null == downlinkTotal ? _self.downlinkTotal : downlinkTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
