// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MutationState<F extends Failure> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutationState<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MutationState<$F>()';
}


}

/// @nodoc
class $MutationStateCopyWith<F extends Failure,$Res>  {
$MutationStateCopyWith(MutationState<F> _, $Res Function(MutationState<F>) __);
}


/// Adds pattern-matching-related methods to [MutationState].
extension MutationStatePatterns<F extends Failure> on MutationState<F> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MutationInitial<F> value)?  initial,TResult Function( MutationInProgress<F> value)?  inProgress,TResult Function( MutationFailure<F> value)?  failure,TResult Function( MutationSuccess<F> value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MutationInitial() when initial != null:
return initial(_that);case MutationInProgress() when inProgress != null:
return inProgress(_that);case MutationFailure() when failure != null:
return failure(_that);case MutationSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MutationInitial<F> value)  initial,required TResult Function( MutationInProgress<F> value)  inProgress,required TResult Function( MutationFailure<F> value)  failure,required TResult Function( MutationSuccess<F> value)  success,}){
final _that = this;
switch (_that) {
case MutationInitial():
return initial(_that);case MutationInProgress():
return inProgress(_that);case MutationFailure():
return failure(_that);case MutationSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MutationInitial<F> value)?  initial,TResult? Function( MutationInProgress<F> value)?  inProgress,TResult? Function( MutationFailure<F> value)?  failure,TResult? Function( MutationSuccess<F> value)?  success,}){
final _that = this;
switch (_that) {
case MutationInitial() when initial != null:
return initial(_that);case MutationInProgress() when inProgress != null:
return inProgress(_that);case MutationFailure() when failure != null:
return failure(_that);case MutationSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function( Failure failure)?  failure,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MutationInitial() when initial != null:
return initial();case MutationInProgress() when inProgress != null:
return inProgress();case MutationFailure() when failure != null:
return failure(_that.failure);case MutationSuccess() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function( Failure failure)  failure,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case MutationInitial():
return initial();case MutationInProgress():
return inProgress();case MutationFailure():
return failure(_that.failure);case MutationSuccess():
return success();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function( Failure failure)?  failure,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case MutationInitial() when initial != null:
return initial();case MutationInProgress() when inProgress != null:
return inProgress();case MutationFailure() when failure != null:
return failure(_that.failure);case MutationSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class MutationInitial<F extends Failure> extends MutationState<F> {
  const MutationInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutationInitial<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MutationState<$F>.initial()';
}


}




/// @nodoc


class MutationInProgress<F extends Failure> extends MutationState<F> {
  const MutationInProgress(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutationInProgress<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MutationState<$F>.inProgress()';
}


}




/// @nodoc


class MutationFailure<F extends Failure> extends MutationState<F> {
  const MutationFailure(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of MutationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MutationFailureCopyWith<F, MutationFailure<F>> get copyWith => _$MutationFailureCopyWithImpl<F, MutationFailure<F>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutationFailure<F>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'MutationState<$F>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $MutationFailureCopyWith<F extends Failure,$Res> implements $MutationStateCopyWith<F, $Res> {
  factory $MutationFailureCopyWith(MutationFailure<F> value, $Res Function(MutationFailure<F>) _then) = _$MutationFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$MutationFailureCopyWithImpl<F extends Failure,$Res>
    implements $MutationFailureCopyWith<F, $Res> {
  _$MutationFailureCopyWithImpl(this._self, this._then);

  final MutationFailure<F> _self;
  final $Res Function(MutationFailure<F>) _then;

/// Create a copy of MutationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(MutationFailure<F>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class MutationSuccess<F extends Failure> extends MutationState<F> {
  const MutationSuccess(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutationSuccess<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MutationState<$F>.success()';
}


}




// dart format on
