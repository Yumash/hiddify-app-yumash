// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectionStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionStatus()';
}


}

/// @nodoc
class $ConnectionStatusCopyWith<$Res>  {
$ConnectionStatusCopyWith(ConnectionStatus _, $Res Function(ConnectionStatus) __);
}


/// Adds pattern-matching-related methods to [ConnectionStatus].
extension ConnectionStatusPatterns on ConnectionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Disconnected value)?  disconnected,TResult Function( Connecting value)?  connecting,TResult Function( Connected value)?  connected,TResult Function( Disconnecting value)?  disconnecting,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Disconnected() when disconnected != null:
return disconnected(_that);case Connecting() when connecting != null:
return connecting(_that);case Connected() when connected != null:
return connected(_that);case Disconnecting() when disconnecting != null:
return disconnecting(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Disconnected value)  disconnected,required TResult Function( Connecting value)  connecting,required TResult Function( Connected value)  connected,required TResult Function( Disconnecting value)  disconnecting,}){
final _that = this;
switch (_that) {
case Disconnected():
return disconnected(_that);case Connecting():
return connecting(_that);case Connected():
return connected(_that);case Disconnecting():
return disconnecting(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Disconnected value)?  disconnected,TResult? Function( Connecting value)?  connecting,TResult? Function( Connected value)?  connected,TResult? Function( Disconnecting value)?  disconnecting,}){
final _that = this;
switch (_that) {
case Disconnected() when disconnected != null:
return disconnected(_that);case Connecting() when connecting != null:
return connecting(_that);case Connected() when connected != null:
return connected(_that);case Disconnecting() when disconnecting != null:
return disconnecting(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ConnectionFailure? connectionFailure)?  disconnected,TResult Function()?  connecting,TResult Function()?  connected,TResult Function()?  disconnecting,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Disconnected() when disconnected != null:
return disconnected(_that.connectionFailure);case Connecting() when connecting != null:
return connecting();case Connected() when connected != null:
return connected();case Disconnecting() when disconnecting != null:
return disconnecting();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ConnectionFailure? connectionFailure)  disconnected,required TResult Function()  connecting,required TResult Function()  connected,required TResult Function()  disconnecting,}) {final _that = this;
switch (_that) {
case Disconnected():
return disconnected(_that.connectionFailure);case Connecting():
return connecting();case Connected():
return connected();case Disconnecting():
return disconnecting();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ConnectionFailure? connectionFailure)?  disconnected,TResult? Function()?  connecting,TResult? Function()?  connected,TResult? Function()?  disconnecting,}) {final _that = this;
switch (_that) {
case Disconnected() when disconnected != null:
return disconnected(_that.connectionFailure);case Connecting() when connecting != null:
return connecting();case Connected() when connected != null:
return connected();case Disconnecting() when disconnecting != null:
return disconnecting();case _:
  return null;

}
}

}

/// @nodoc


class Disconnected extends ConnectionStatus {
  const Disconnected([this.connectionFailure]): super._();
  

 final  ConnectionFailure? connectionFailure;

/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisconnectedCopyWith<Disconnected> get copyWith => _$DisconnectedCopyWithImpl<Disconnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Disconnected&&(identical(other.connectionFailure, connectionFailure) || other.connectionFailure == connectionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,connectionFailure);

@override
String toString() {
  return 'ConnectionStatus.disconnected(connectionFailure: $connectionFailure)';
}


}

/// @nodoc
abstract mixin class $DisconnectedCopyWith<$Res> implements $ConnectionStatusCopyWith<$Res> {
  factory $DisconnectedCopyWith(Disconnected value, $Res Function(Disconnected) _then) = _$DisconnectedCopyWithImpl;
@useResult
$Res call({
 ConnectionFailure? connectionFailure
});


$ConnectionFailureCopyWith<$Res>? get connectionFailure;

}
/// @nodoc
class _$DisconnectedCopyWithImpl<$Res>
    implements $DisconnectedCopyWith<$Res> {
  _$DisconnectedCopyWithImpl(this._self, this._then);

  final Disconnected _self;
  final $Res Function(Disconnected) _then;

/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? connectionFailure = freezed,}) {
  return _then(Disconnected(
freezed == connectionFailure ? _self.connectionFailure : connectionFailure // ignore: cast_nullable_to_non_nullable
as ConnectionFailure?,
  ));
}

/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionFailureCopyWith<$Res>? get connectionFailure {
    if (_self.connectionFailure == null) {
    return null;
  }

  return $ConnectionFailureCopyWith<$Res>(_self.connectionFailure!, (value) {
    return _then(_self.copyWith(connectionFailure: value));
  });
}
}

/// @nodoc


class Connecting extends ConnectionStatus {
  const Connecting(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connecting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionStatus.connecting()';
}


}




/// @nodoc


class Connected extends ConnectionStatus {
  const Connected(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionStatus.connected()';
}


}




/// @nodoc


class Disconnecting extends ConnectionStatus {
  const Disconnecting(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Disconnecting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionStatus.disconnecting()';
}


}




// dart format on
