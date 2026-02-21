// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_mutation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncMutation {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncMutation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncMutation()';
}


}

/// @nodoc
class $AsyncMutationCopyWith<$Res>  {
$AsyncMutationCopyWith(AsyncMutation _, $Res Function(AsyncMutation) __);
}


/// Adds pattern-matching-related methods to [AsyncMutation].
extension AsyncMutationPatterns on AsyncMutation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Idle value)?  idle,TResult Function( InProgress value)?  inProgress,TResult Function( Fail value)?  fail,TResult Function( Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case InProgress() when inProgress != null:
return inProgress(_that);case Fail() when fail != null:
return fail(_that);case Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Idle value)  idle,required TResult Function( InProgress value)  inProgress,required TResult Function( Fail value)  fail,required TResult Function( Success value)  success,}){
final _that = this;
switch (_that) {
case Idle():
return idle(_that);case InProgress():
return inProgress(_that);case Fail():
return fail(_that);case Success():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Idle value)?  idle,TResult? Function( InProgress value)?  inProgress,TResult? Function( Fail value)?  fail,TResult? Function( Success value)?  success,}){
final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle(_that);case InProgress() when inProgress != null:
return inProgress(_that);case Fail() when fail != null:
return fail(_that);case Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  inProgress,TResult Function( Object error,  StackTrace stackTrace)?  fail,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case InProgress() when inProgress != null:
return inProgress();case Fail() when fail != null:
return fail(_that.error,_that.stackTrace);case Success() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  inProgress,required TResult Function( Object error,  StackTrace stackTrace)  fail,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case Idle():
return idle();case InProgress():
return inProgress();case Fail():
return fail(_that.error,_that.stackTrace);case Success():
return success();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  inProgress,TResult? Function( Object error,  StackTrace stackTrace)?  fail,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case Idle() when idle != null:
return idle();case InProgress() when inProgress != null:
return inProgress();case Fail() when fail != null:
return fail(_that.error,_that.stackTrace);case Success() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class Idle extends AsyncMutation {
  const Idle(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncMutation.idle()';
}


}




/// @nodoc


class InProgress extends AsyncMutation {
  const InProgress(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncMutation.inProgress()';
}


}




/// @nodoc


class Fail extends AsyncMutation {
  const Fail(this.error, this.stackTrace): super._();
  

 final  Object error;
 final  StackTrace stackTrace;

/// Create a copy of AsyncMutation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailCopyWith<Fail> get copyWith => _$FailCopyWithImpl<Fail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fail&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'AsyncMutation.fail(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $FailCopyWith<$Res> implements $AsyncMutationCopyWith<$Res> {
  factory $FailCopyWith(Fail value, $Res Function(Fail) _then) = _$FailCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace stackTrace
});




}
/// @nodoc
class _$FailCopyWithImpl<$Res>
    implements $FailCopyWith<$Res> {
  _$FailCopyWithImpl(this._self, this._then);

  final Fail _self;
  final $Res Function(Fail) _then;

/// Create a copy of AsyncMutation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stackTrace = null,}) {
  return _then(Fail(
null == error ? _self.error : error ,null == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

/// @nodoc


class Success extends AsyncMutation {
  const Success(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncMutation.success()';
}


}




// dart format on
