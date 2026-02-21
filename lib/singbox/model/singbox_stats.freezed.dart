// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singbox_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingboxStats {

 int get connectionsIn; int get connectionsOut; int get uplink; int get downlink; int get uplinkTotal; int get downlinkTotal;
/// Create a copy of SingboxStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxStatsCopyWith<SingboxStats> get copyWith => _$SingboxStatsCopyWithImpl<SingboxStats>(this as SingboxStats, _$identity);

  /// Serializes this SingboxStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxStats&&(identical(other.connectionsIn, connectionsIn) || other.connectionsIn == connectionsIn)&&(identical(other.connectionsOut, connectionsOut) || other.connectionsOut == connectionsOut)&&(identical(other.uplink, uplink) || other.uplink == uplink)&&(identical(other.downlink, downlink) || other.downlink == downlink)&&(identical(other.uplinkTotal, uplinkTotal) || other.uplinkTotal == uplinkTotal)&&(identical(other.downlinkTotal, downlinkTotal) || other.downlinkTotal == downlinkTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionsIn,connectionsOut,uplink,downlink,uplinkTotal,downlinkTotal);

@override
String toString() {
  return 'SingboxStats(connectionsIn: $connectionsIn, connectionsOut: $connectionsOut, uplink: $uplink, downlink: $downlink, uplinkTotal: $uplinkTotal, downlinkTotal: $downlinkTotal)';
}


}

/// @nodoc
abstract mixin class $SingboxStatsCopyWith<$Res>  {
  factory $SingboxStatsCopyWith(SingboxStats value, $Res Function(SingboxStats) _then) = _$SingboxStatsCopyWithImpl;
@useResult
$Res call({
 int connectionsIn, int connectionsOut, int uplink, int downlink, int uplinkTotal, int downlinkTotal
});




}
/// @nodoc
class _$SingboxStatsCopyWithImpl<$Res>
    implements $SingboxStatsCopyWith<$Res> {
  _$SingboxStatsCopyWithImpl(this._self, this._then);

  final SingboxStats _self;
  final $Res Function(SingboxStats) _then;

/// Create a copy of SingboxStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionsIn = null,Object? connectionsOut = null,Object? uplink = null,Object? downlink = null,Object? uplinkTotal = null,Object? downlinkTotal = null,}) {
  return _then(_self.copyWith(
connectionsIn: null == connectionsIn ? _self.connectionsIn : connectionsIn // ignore: cast_nullable_to_non_nullable
as int,connectionsOut: null == connectionsOut ? _self.connectionsOut : connectionsOut // ignore: cast_nullable_to_non_nullable
as int,uplink: null == uplink ? _self.uplink : uplink // ignore: cast_nullable_to_non_nullable
as int,downlink: null == downlink ? _self.downlink : downlink // ignore: cast_nullable_to_non_nullable
as int,uplinkTotal: null == uplinkTotal ? _self.uplinkTotal : uplinkTotal // ignore: cast_nullable_to_non_nullable
as int,downlinkTotal: null == downlinkTotal ? _self.downlinkTotal : downlinkTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SingboxStats].
extension SingboxStatsPatterns on SingboxStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxStats value)  $default,){
final _that = this;
switch (_that) {
case _SingboxStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxStats value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int connectionsIn,  int connectionsOut,  int uplink,  int downlink,  int uplinkTotal,  int downlinkTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxStats() when $default != null:
return $default(_that.connectionsIn,_that.connectionsOut,_that.uplink,_that.downlink,_that.uplinkTotal,_that.downlinkTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int connectionsIn,  int connectionsOut,  int uplink,  int downlink,  int uplinkTotal,  int downlinkTotal)  $default,) {final _that = this;
switch (_that) {
case _SingboxStats():
return $default(_that.connectionsIn,_that.connectionsOut,_that.uplink,_that.downlink,_that.uplinkTotal,_that.downlinkTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int connectionsIn,  int connectionsOut,  int uplink,  int downlink,  int uplinkTotal,  int downlinkTotal)?  $default,) {final _that = this;
switch (_that) {
case _SingboxStats() when $default != null:
return $default(_that.connectionsIn,_that.connectionsOut,_that.uplink,_that.downlink,_that.uplinkTotal,_that.downlinkTotal);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxStats extends SingboxStats {
  const _SingboxStats({required this.connectionsIn, required this.connectionsOut, required this.uplink, required this.downlink, required this.uplinkTotal, required this.downlinkTotal}): super._();
  factory _SingboxStats.fromJson(Map<String, dynamic> json) => _$SingboxStatsFromJson(json);

@override final  int connectionsIn;
@override final  int connectionsOut;
@override final  int uplink;
@override final  int downlink;
@override final  int uplinkTotal;
@override final  int downlinkTotal;

/// Create a copy of SingboxStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxStatsCopyWith<_SingboxStats> get copyWith => __$SingboxStatsCopyWithImpl<_SingboxStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxStats&&(identical(other.connectionsIn, connectionsIn) || other.connectionsIn == connectionsIn)&&(identical(other.connectionsOut, connectionsOut) || other.connectionsOut == connectionsOut)&&(identical(other.uplink, uplink) || other.uplink == uplink)&&(identical(other.downlink, downlink) || other.downlink == downlink)&&(identical(other.uplinkTotal, uplinkTotal) || other.uplinkTotal == uplinkTotal)&&(identical(other.downlinkTotal, downlinkTotal) || other.downlinkTotal == downlinkTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionsIn,connectionsOut,uplink,downlink,uplinkTotal,downlinkTotal);

@override
String toString() {
  return 'SingboxStats(connectionsIn: $connectionsIn, connectionsOut: $connectionsOut, uplink: $uplink, downlink: $downlink, uplinkTotal: $uplinkTotal, downlinkTotal: $downlinkTotal)';
}


}

/// @nodoc
abstract mixin class _$SingboxStatsCopyWith<$Res> implements $SingboxStatsCopyWith<$Res> {
  factory _$SingboxStatsCopyWith(_SingboxStats value, $Res Function(_SingboxStats) _then) = __$SingboxStatsCopyWithImpl;
@override @useResult
$Res call({
 int connectionsIn, int connectionsOut, int uplink, int downlink, int uplinkTotal, int downlinkTotal
});




}
/// @nodoc
class __$SingboxStatsCopyWithImpl<$Res>
    implements _$SingboxStatsCopyWith<$Res> {
  __$SingboxStatsCopyWithImpl(this._self, this._then);

  final _SingboxStats _self;
  final $Res Function(_SingboxStats) _then;

/// Create a copy of SingboxStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionsIn = null,Object? connectionsOut = null,Object? uplink = null,Object? downlink = null,Object? uplinkTotal = null,Object? downlinkTotal = null,}) {
  return _then(_SingboxStats(
connectionsIn: null == connectionsIn ? _self.connectionsIn : connectionsIn // ignore: cast_nullable_to_non_nullable
as int,connectionsOut: null == connectionsOut ? _self.connectionsOut : connectionsOut // ignore: cast_nullable_to_non_nullable
as int,uplink: null == uplink ? _self.uplink : uplink // ignore: cast_nullable_to_non_nullable
as int,downlink: null == downlink ? _self.downlink : downlink // ignore: cast_nullable_to_non_nullable
as int,uplinkTotal: null == uplinkTotal ? _self.uplinkTotal : uplinkTotal // ignore: cast_nullable_to_non_nullable
as int,downlinkTotal: null == downlinkTotal ? _self.downlinkTotal : downlinkTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
