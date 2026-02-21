// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proxy_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProxyGroupEntity {

 String get tag; ProxyType get type; String get selected; List<ProxyItemEntity> get items;
/// Create a copy of ProxyGroupEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyGroupEntityCopyWith<ProxyGroupEntity> get copyWith => _$ProxyGroupEntityCopyWithImpl<ProxyGroupEntity>(this as ProxyGroupEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyGroupEntity&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,tag,type,selected,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ProxyGroupEntity(tag: $tag, type: $type, selected: $selected, items: $items)';
}


}

/// @nodoc
abstract mixin class $ProxyGroupEntityCopyWith<$Res>  {
  factory $ProxyGroupEntityCopyWith(ProxyGroupEntity value, $Res Function(ProxyGroupEntity) _then) = _$ProxyGroupEntityCopyWithImpl;
@useResult
$Res call({
 String tag, ProxyType type, String selected, List<ProxyItemEntity> items
});




}
/// @nodoc
class _$ProxyGroupEntityCopyWithImpl<$Res>
    implements $ProxyGroupEntityCopyWith<$Res> {
  _$ProxyGroupEntityCopyWithImpl(this._self, this._then);

  final ProxyGroupEntity _self;
  final $Res Function(ProxyGroupEntity) _then;

/// Create a copy of ProxyGroupEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? type = null,Object? selected = null,Object? items = null,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProxyItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxyGroupEntity].
extension ProxyGroupEntityPatterns on ProxyGroupEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxyGroupEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxyGroupEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxyGroupEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProxyGroupEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxyGroupEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProxyGroupEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag,  ProxyType type,  String selected,  List<ProxyItemEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxyGroupEntity() when $default != null:
return $default(_that.tag,_that.type,_that.selected,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag,  ProxyType type,  String selected,  List<ProxyItemEntity> items)  $default,) {final _that = this;
switch (_that) {
case _ProxyGroupEntity():
return $default(_that.tag,_that.type,_that.selected,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag,  ProxyType type,  String selected,  List<ProxyItemEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _ProxyGroupEntity() when $default != null:
return $default(_that.tag,_that.type,_that.selected,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ProxyGroupEntity extends ProxyGroupEntity {
  const _ProxyGroupEntity({required this.tag, required this.type, required this.selected, final  List<ProxyItemEntity> items = const []}): _items = items,super._();
  

@override final  String tag;
@override final  ProxyType type;
@override final  String selected;
 final  List<ProxyItemEntity> _items;
@override@JsonKey() List<ProxyItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ProxyGroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyGroupEntityCopyWith<_ProxyGroupEntity> get copyWith => __$ProxyGroupEntityCopyWithImpl<_ProxyGroupEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxyGroupEntity&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,tag,type,selected,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ProxyGroupEntity(tag: $tag, type: $type, selected: $selected, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ProxyGroupEntityCopyWith<$Res> implements $ProxyGroupEntityCopyWith<$Res> {
  factory _$ProxyGroupEntityCopyWith(_ProxyGroupEntity value, $Res Function(_ProxyGroupEntity) _then) = __$ProxyGroupEntityCopyWithImpl;
@override @useResult
$Res call({
 String tag, ProxyType type, String selected, List<ProxyItemEntity> items
});




}
/// @nodoc
class __$ProxyGroupEntityCopyWithImpl<$Res>
    implements _$ProxyGroupEntityCopyWith<$Res> {
  __$ProxyGroupEntityCopyWithImpl(this._self, this._then);

  final _ProxyGroupEntity _self;
  final $Res Function(_ProxyGroupEntity) _then;

/// Create a copy of ProxyGroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? type = null,Object? selected = null,Object? items = null,}) {
  return _then(_ProxyGroupEntity(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProxyItemEntity>,
  ));
}


}

/// @nodoc
mixin _$ProxyItemEntity {

 String get tag; ProxyType get type; int get urlTestDelay; String? get selectedTag;
/// Create a copy of ProxyItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyItemEntityCopyWith<ProxyItemEntity> get copyWith => _$ProxyItemEntityCopyWithImpl<ProxyItemEntity>(this as ProxyItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyItemEntity&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.urlTestDelay, urlTestDelay) || other.urlTestDelay == urlTestDelay)&&(identical(other.selectedTag, selectedTag) || other.selectedTag == selectedTag));
}


@override
int get hashCode => Object.hash(runtimeType,tag,type,urlTestDelay,selectedTag);

@override
String toString() {
  return 'ProxyItemEntity(tag: $tag, type: $type, urlTestDelay: $urlTestDelay, selectedTag: $selectedTag)';
}


}

/// @nodoc
abstract mixin class $ProxyItemEntityCopyWith<$Res>  {
  factory $ProxyItemEntityCopyWith(ProxyItemEntity value, $Res Function(ProxyItemEntity) _then) = _$ProxyItemEntityCopyWithImpl;
@useResult
$Res call({
 String tag, ProxyType type, int urlTestDelay, String? selectedTag
});




}
/// @nodoc
class _$ProxyItemEntityCopyWithImpl<$Res>
    implements $ProxyItemEntityCopyWith<$Res> {
  _$ProxyItemEntityCopyWithImpl(this._self, this._then);

  final ProxyItemEntity _self;
  final $Res Function(ProxyItemEntity) _then;

/// Create a copy of ProxyItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? type = null,Object? urlTestDelay = null,Object? selectedTag = freezed,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,urlTestDelay: null == urlTestDelay ? _self.urlTestDelay : urlTestDelay // ignore: cast_nullable_to_non_nullable
as int,selectedTag: freezed == selectedTag ? _self.selectedTag : selectedTag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxyItemEntity].
extension ProxyItemEntityPatterns on ProxyItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxyItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxyItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxyItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProxyItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxyItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProxyItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag,  ProxyType type,  int urlTestDelay,  String? selectedTag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxyItemEntity() when $default != null:
return $default(_that.tag,_that.type,_that.urlTestDelay,_that.selectedTag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag,  ProxyType type,  int urlTestDelay,  String? selectedTag)  $default,) {final _that = this;
switch (_that) {
case _ProxyItemEntity():
return $default(_that.tag,_that.type,_that.urlTestDelay,_that.selectedTag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag,  ProxyType type,  int urlTestDelay,  String? selectedTag)?  $default,) {final _that = this;
switch (_that) {
case _ProxyItemEntity() when $default != null:
return $default(_that.tag,_that.type,_that.urlTestDelay,_that.selectedTag);case _:
  return null;

}
}

}

/// @nodoc


class _ProxyItemEntity extends ProxyItemEntity {
  const _ProxyItemEntity({required this.tag, required this.type, required this.urlTestDelay, this.selectedTag}): super._();
  

@override final  String tag;
@override final  ProxyType type;
@override final  int urlTestDelay;
@override final  String? selectedTag;

/// Create a copy of ProxyItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyItemEntityCopyWith<_ProxyItemEntity> get copyWith => __$ProxyItemEntityCopyWithImpl<_ProxyItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxyItemEntity&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.urlTestDelay, urlTestDelay) || other.urlTestDelay == urlTestDelay)&&(identical(other.selectedTag, selectedTag) || other.selectedTag == selectedTag));
}


@override
int get hashCode => Object.hash(runtimeType,tag,type,urlTestDelay,selectedTag);

@override
String toString() {
  return 'ProxyItemEntity(tag: $tag, type: $type, urlTestDelay: $urlTestDelay, selectedTag: $selectedTag)';
}


}

/// @nodoc
abstract mixin class _$ProxyItemEntityCopyWith<$Res> implements $ProxyItemEntityCopyWith<$Res> {
  factory _$ProxyItemEntityCopyWith(_ProxyItemEntity value, $Res Function(_ProxyItemEntity) _then) = __$ProxyItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String tag, ProxyType type, int urlTestDelay, String? selectedTag
});




}
/// @nodoc
class __$ProxyItemEntityCopyWithImpl<$Res>
    implements _$ProxyItemEntityCopyWith<$Res> {
  __$ProxyItemEntityCopyWithImpl(this._self, this._then);

  final _ProxyItemEntity _self;
  final $Res Function(_ProxyItemEntity) _then;

/// Create a copy of ProxyItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? type = null,Object? urlTestDelay = null,Object? selectedTag = freezed,}) {
  return _then(_ProxyItemEntity(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,urlTestDelay: null == urlTestDelay ? _self.urlTestDelay : urlTestDelay // ignore: cast_nullable_to_non_nullable
as int,selectedTag: freezed == selectedTag ? _self.selectedTag : selectedTag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
