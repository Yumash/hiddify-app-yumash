// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proxy_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProxyFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProxyFailure()';
}


}

/// @nodoc
class $ProxyFailureCopyWith<$Res>  {
$ProxyFailureCopyWith(ProxyFailure _, $Res Function(ProxyFailure) __);
}


/// Adds pattern-matching-related methods to [ProxyFailure].
extension ProxyFailurePatterns on ProxyFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProxyUnexpectedFailure value)?  unexpected,TResult Function( ServiceNotRunning value)?  serviceNotRunning,TResult Function( UnknownIp value)?  unknownIp,TResult Function( UnableToRetrieveIp value)?  unableToRetrieveIp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProxyUnexpectedFailure() when unexpected != null:
return unexpected(_that);case ServiceNotRunning() when serviceNotRunning != null:
return serviceNotRunning(_that);case UnknownIp() when unknownIp != null:
return unknownIp(_that);case UnableToRetrieveIp() when unableToRetrieveIp != null:
return unableToRetrieveIp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProxyUnexpectedFailure value)  unexpected,required TResult Function( ServiceNotRunning value)  serviceNotRunning,required TResult Function( UnknownIp value)  unknownIp,required TResult Function( UnableToRetrieveIp value)  unableToRetrieveIp,}){
final _that = this;
switch (_that) {
case ProxyUnexpectedFailure():
return unexpected(_that);case ServiceNotRunning():
return serviceNotRunning(_that);case UnknownIp():
return unknownIp(_that);case UnableToRetrieveIp():
return unableToRetrieveIp(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProxyUnexpectedFailure value)?  unexpected,TResult? Function( ServiceNotRunning value)?  serviceNotRunning,TResult? Function( UnknownIp value)?  unknownIp,TResult? Function( UnableToRetrieveIp value)?  unableToRetrieveIp,}){
final _that = this;
switch (_that) {
case ProxyUnexpectedFailure() when unexpected != null:
return unexpected(_that);case ServiceNotRunning() when serviceNotRunning != null:
return serviceNotRunning(_that);case UnknownIp() when unknownIp != null:
return unknownIp(_that);case UnableToRetrieveIp() when unableToRetrieveIp != null:
return unableToRetrieveIp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? error,  StackTrace? stackTrace)?  unexpected,TResult Function()?  serviceNotRunning,TResult Function()?  unknownIp,TResult Function( Object? error,  StackTrace? stackTrace)?  unableToRetrieveIp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProxyUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case ServiceNotRunning() when serviceNotRunning != null:
return serviceNotRunning();case UnknownIp() when unknownIp != null:
return unknownIp();case UnableToRetrieveIp() when unableToRetrieveIp != null:
return unableToRetrieveIp(_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? error,  StackTrace? stackTrace)  unexpected,required TResult Function()  serviceNotRunning,required TResult Function()  unknownIp,required TResult Function( Object? error,  StackTrace? stackTrace)  unableToRetrieveIp,}) {final _that = this;
switch (_that) {
case ProxyUnexpectedFailure():
return unexpected(_that.error,_that.stackTrace);case ServiceNotRunning():
return serviceNotRunning();case UnknownIp():
return unknownIp();case UnableToRetrieveIp():
return unableToRetrieveIp(_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? error,  StackTrace? stackTrace)?  unexpected,TResult? Function()?  serviceNotRunning,TResult? Function()?  unknownIp,TResult? Function( Object? error,  StackTrace? stackTrace)?  unableToRetrieveIp,}) {final _that = this;
switch (_that) {
case ProxyUnexpectedFailure() when unexpected != null:
return unexpected(_that.error,_that.stackTrace);case ServiceNotRunning() when serviceNotRunning != null:
return serviceNotRunning();case UnknownIp() when unknownIp != null:
return unknownIp();case UnableToRetrieveIp() when unableToRetrieveIp != null:
return unableToRetrieveIp(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class ProxyUnexpectedFailure extends ProxyFailure with UnexpectedFailure {
  const ProxyUnexpectedFailure([this.error, this.stackTrace]): super._();
  

 final  Object? error;
 final  StackTrace? stackTrace;

/// Create a copy of ProxyFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyUnexpectedFailureCopyWith<ProxyUnexpectedFailure> get copyWith => _$ProxyUnexpectedFailureCopyWithImpl<ProxyUnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyUnexpectedFailure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ProxyFailure.unexpected(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $ProxyUnexpectedFailureCopyWith<$Res> implements $ProxyFailureCopyWith<$Res> {
  factory $ProxyUnexpectedFailureCopyWith(ProxyUnexpectedFailure value, $Res Function(ProxyUnexpectedFailure) _then) = _$ProxyUnexpectedFailureCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$ProxyUnexpectedFailureCopyWithImpl<$Res>
    implements $ProxyUnexpectedFailureCopyWith<$Res> {
  _$ProxyUnexpectedFailureCopyWithImpl(this._self, this._then);

  final ProxyUnexpectedFailure _self;
  final $Res Function(ProxyUnexpectedFailure) _then;

/// Create a copy of ProxyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(ProxyUnexpectedFailure(
freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class ServiceNotRunning extends ProxyFailure with ExpectedFailure {
  const ServiceNotRunning(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceNotRunning);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProxyFailure.serviceNotRunning()';
}


}




/// @nodoc


class UnknownIp extends ProxyFailure with ExpectedFailure {
  const UnknownIp(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownIp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProxyFailure.unknownIp()';
}


}




/// @nodoc


class UnableToRetrieveIp extends ProxyFailure with ExpectedMeasuredFailure {
  const UnableToRetrieveIp([this.error, this.stackTrace]): super._();
  

 final  Object? error;
 final  StackTrace? stackTrace;

/// Create a copy of ProxyFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnableToRetrieveIpCopyWith<UnableToRetrieveIp> get copyWith => _$UnableToRetrieveIpCopyWithImpl<UnableToRetrieveIp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnableToRetrieveIp&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ProxyFailure.unableToRetrieveIp(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $UnableToRetrieveIpCopyWith<$Res> implements $ProxyFailureCopyWith<$Res> {
  factory $UnableToRetrieveIpCopyWith(UnableToRetrieveIp value, $Res Function(UnableToRetrieveIp) _then) = _$UnableToRetrieveIpCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$UnableToRetrieveIpCopyWithImpl<$Res>
    implements $UnableToRetrieveIpCopyWith<$Res> {
  _$UnableToRetrieveIpCopyWithImpl(this._self, this._then);

  final UnableToRetrieveIp _self;
  final $Res Function(UnableToRetrieveIp) _then;

/// Create a copy of ProxyFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(UnableToRetrieveIp(
freezed == error ? _self.error : error ,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
