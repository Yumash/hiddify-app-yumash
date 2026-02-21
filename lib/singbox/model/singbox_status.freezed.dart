// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singbox_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SingboxStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SingboxStatus()';
}


}

/// @nodoc
class $SingboxStatusCopyWith<$Res>  {
$SingboxStatusCopyWith(SingboxStatus _, $Res Function(SingboxStatus) __);
}


/// Adds pattern-matching-related methods to [SingboxStatus].
extension SingboxStatusPatterns on SingboxStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SingboxStopped value)?  stopped,TResult Function( SingboxStarting value)?  starting,TResult Function( SingboxStarted value)?  started,TResult Function( SingboxStopping value)?  stopping,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SingboxStopped() when stopped != null:
return stopped(_that);case SingboxStarting() when starting != null:
return starting(_that);case SingboxStarted() when started != null:
return started(_that);case SingboxStopping() when stopping != null:
return stopping(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SingboxStopped value)  stopped,required TResult Function( SingboxStarting value)  starting,required TResult Function( SingboxStarted value)  started,required TResult Function( SingboxStopping value)  stopping,}){
final _that = this;
switch (_that) {
case SingboxStopped():
return stopped(_that);case SingboxStarting():
return starting(_that);case SingboxStarted():
return started(_that);case SingboxStopping():
return stopping(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SingboxStopped value)?  stopped,TResult? Function( SingboxStarting value)?  starting,TResult? Function( SingboxStarted value)?  started,TResult? Function( SingboxStopping value)?  stopping,}){
final _that = this;
switch (_that) {
case SingboxStopped() when stopped != null:
return stopped(_that);case SingboxStarting() when starting != null:
return starting(_that);case SingboxStarted() when started != null:
return started(_that);case SingboxStopping() when stopping != null:
return stopping(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SingboxAlert? alert,  String? message)?  stopped,TResult Function()?  starting,TResult Function()?  started,TResult Function()?  stopping,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SingboxStopped() when stopped != null:
return stopped(_that.alert,_that.message);case SingboxStarting() when starting != null:
return starting();case SingboxStarted() when started != null:
return started();case SingboxStopping() when stopping != null:
return stopping();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SingboxAlert? alert,  String? message)  stopped,required TResult Function()  starting,required TResult Function()  started,required TResult Function()  stopping,}) {final _that = this;
switch (_that) {
case SingboxStopped():
return stopped(_that.alert,_that.message);case SingboxStarting():
return starting();case SingboxStarted():
return started();case SingboxStopping():
return stopping();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SingboxAlert? alert,  String? message)?  stopped,TResult? Function()?  starting,TResult? Function()?  started,TResult? Function()?  stopping,}) {final _that = this;
switch (_that) {
case SingboxStopped() when stopped != null:
return stopped(_that.alert,_that.message);case SingboxStarting() when starting != null:
return starting();case SingboxStarted() when started != null:
return started();case SingboxStopping() when stopping != null:
return stopping();case _:
  return null;

}
}

}

/// @nodoc


class SingboxStopped extends SingboxStatus {
  const SingboxStopped({this.alert, this.message}): super._();
  

 final  SingboxAlert? alert;
 final  String? message;

/// Create a copy of SingboxStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxStoppedCopyWith<SingboxStopped> get copyWith => _$SingboxStoppedCopyWithImpl<SingboxStopped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxStopped&&(identical(other.alert, alert) || other.alert == alert)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,alert,message);

@override
String toString() {
  return 'SingboxStatus.stopped(alert: $alert, message: $message)';
}


}

/// @nodoc
abstract mixin class $SingboxStoppedCopyWith<$Res> implements $SingboxStatusCopyWith<$Res> {
  factory $SingboxStoppedCopyWith(SingboxStopped value, $Res Function(SingboxStopped) _then) = _$SingboxStoppedCopyWithImpl;
@useResult
$Res call({
 SingboxAlert? alert, String? message
});




}
/// @nodoc
class _$SingboxStoppedCopyWithImpl<$Res>
    implements $SingboxStoppedCopyWith<$Res> {
  _$SingboxStoppedCopyWithImpl(this._self, this._then);

  final SingboxStopped _self;
  final $Res Function(SingboxStopped) _then;

/// Create a copy of SingboxStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alert = freezed,Object? message = freezed,}) {
  return _then(SingboxStopped(
alert: freezed == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as SingboxAlert?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SingboxStarting extends SingboxStatus {
  const SingboxStarting(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxStarting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SingboxStatus.starting()';
}


}




/// @nodoc


class SingboxStarted extends SingboxStatus {
  const SingboxStarted(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SingboxStatus.started()';
}


}




/// @nodoc


class SingboxStopping extends SingboxStatus {
  const SingboxStopping(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxStopping);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SingboxStatus.stopping()';
}


}




// dart format on
