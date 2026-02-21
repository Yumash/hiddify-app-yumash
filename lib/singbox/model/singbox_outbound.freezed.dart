// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singbox_outbound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingboxOutboundGroup {

 String get tag;@JsonKey(fromJson: _typeFromJson) ProxyType get type; String get selected; List<SingboxOutboundGroupItem> get items;
/// Create a copy of SingboxOutboundGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxOutboundGroupCopyWith<SingboxOutboundGroup> get copyWith => _$SingboxOutboundGroupCopyWithImpl<SingboxOutboundGroup>(this as SingboxOutboundGroup, _$identity);

  /// Serializes this SingboxOutboundGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxOutboundGroup&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tag,type,selected,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SingboxOutboundGroup(tag: $tag, type: $type, selected: $selected, items: $items)';
}


}

/// @nodoc
abstract mixin class $SingboxOutboundGroupCopyWith<$Res>  {
  factory $SingboxOutboundGroupCopyWith(SingboxOutboundGroup value, $Res Function(SingboxOutboundGroup) _then) = _$SingboxOutboundGroupCopyWithImpl;
@useResult
$Res call({
 String tag,@JsonKey(fromJson: _typeFromJson) ProxyType type, String selected, List<SingboxOutboundGroupItem> items
});




}
/// @nodoc
class _$SingboxOutboundGroupCopyWithImpl<$Res>
    implements $SingboxOutboundGroupCopyWith<$Res> {
  _$SingboxOutboundGroupCopyWithImpl(this._self, this._then);

  final SingboxOutboundGroup _self;
  final $Res Function(SingboxOutboundGroup) _then;

/// Create a copy of SingboxOutboundGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? type = null,Object? selected = null,Object? items = null,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SingboxOutboundGroupItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SingboxOutboundGroup].
extension SingboxOutboundGroupPatterns on SingboxOutboundGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxOutboundGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxOutboundGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxOutboundGroup value)  $default,){
final _that = this;
switch (_that) {
case _SingboxOutboundGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxOutboundGroup value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxOutboundGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag, @JsonKey(fromJson: _typeFromJson)  ProxyType type,  String selected,  List<SingboxOutboundGroupItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxOutboundGroup() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag, @JsonKey(fromJson: _typeFromJson)  ProxyType type,  String selected,  List<SingboxOutboundGroupItem> items)  $default,) {final _that = this;
switch (_that) {
case _SingboxOutboundGroup():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag, @JsonKey(fromJson: _typeFromJson)  ProxyType type,  String selected,  List<SingboxOutboundGroupItem> items)?  $default,) {final _that = this;
switch (_that) {
case _SingboxOutboundGroup() when $default != null:
return $default(_that.tag,_that.type,_that.selected,_that.items);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxOutboundGroup implements SingboxOutboundGroup {
  const _SingboxOutboundGroup({required this.tag, @JsonKey(fromJson: _typeFromJson) required this.type, required this.selected, final  List<SingboxOutboundGroupItem> items = const []}): _items = items;
  factory _SingboxOutboundGroup.fromJson(Map<String, dynamic> json) => _$SingboxOutboundGroupFromJson(json);

@override final  String tag;
@override@JsonKey(fromJson: _typeFromJson) final  ProxyType type;
@override final  String selected;
 final  List<SingboxOutboundGroupItem> _items;
@override@JsonKey() List<SingboxOutboundGroupItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SingboxOutboundGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxOutboundGroupCopyWith<_SingboxOutboundGroup> get copyWith => __$SingboxOutboundGroupCopyWithImpl<_SingboxOutboundGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxOutboundGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxOutboundGroup&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tag,type,selected,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SingboxOutboundGroup(tag: $tag, type: $type, selected: $selected, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SingboxOutboundGroupCopyWith<$Res> implements $SingboxOutboundGroupCopyWith<$Res> {
  factory _$SingboxOutboundGroupCopyWith(_SingboxOutboundGroup value, $Res Function(_SingboxOutboundGroup) _then) = __$SingboxOutboundGroupCopyWithImpl;
@override @useResult
$Res call({
 String tag,@JsonKey(fromJson: _typeFromJson) ProxyType type, String selected, List<SingboxOutboundGroupItem> items
});




}
/// @nodoc
class __$SingboxOutboundGroupCopyWithImpl<$Res>
    implements _$SingboxOutboundGroupCopyWith<$Res> {
  __$SingboxOutboundGroupCopyWithImpl(this._self, this._then);

  final _SingboxOutboundGroup _self;
  final $Res Function(_SingboxOutboundGroup) _then;

/// Create a copy of SingboxOutboundGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? type = null,Object? selected = null,Object? items = null,}) {
  return _then(_SingboxOutboundGroup(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SingboxOutboundGroupItem>,
  ));
}


}


/// @nodoc
mixin _$SingboxOutboundGroupItem {

 String get tag;@JsonKey(fromJson: _typeFromJson) ProxyType get type; int get urlTestDelay;
/// Create a copy of SingboxOutboundGroupItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxOutboundGroupItemCopyWith<SingboxOutboundGroupItem> get copyWith => _$SingboxOutboundGroupItemCopyWithImpl<SingboxOutboundGroupItem>(this as SingboxOutboundGroupItem, _$identity);

  /// Serializes this SingboxOutboundGroupItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxOutboundGroupItem&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.urlTestDelay, urlTestDelay) || other.urlTestDelay == urlTestDelay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tag,type,urlTestDelay);

@override
String toString() {
  return 'SingboxOutboundGroupItem(tag: $tag, type: $type, urlTestDelay: $urlTestDelay)';
}


}

/// @nodoc
abstract mixin class $SingboxOutboundGroupItemCopyWith<$Res>  {
  factory $SingboxOutboundGroupItemCopyWith(SingboxOutboundGroupItem value, $Res Function(SingboxOutboundGroupItem) _then) = _$SingboxOutboundGroupItemCopyWithImpl;
@useResult
$Res call({
 String tag,@JsonKey(fromJson: _typeFromJson) ProxyType type, int urlTestDelay
});




}
/// @nodoc
class _$SingboxOutboundGroupItemCopyWithImpl<$Res>
    implements $SingboxOutboundGroupItemCopyWith<$Res> {
  _$SingboxOutboundGroupItemCopyWithImpl(this._self, this._then);

  final SingboxOutboundGroupItem _self;
  final $Res Function(SingboxOutboundGroupItem) _then;

/// Create a copy of SingboxOutboundGroupItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? type = null,Object? urlTestDelay = null,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,urlTestDelay: null == urlTestDelay ? _self.urlTestDelay : urlTestDelay // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SingboxOutboundGroupItem].
extension SingboxOutboundGroupItemPatterns on SingboxOutboundGroupItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxOutboundGroupItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxOutboundGroupItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxOutboundGroupItem value)  $default,){
final _that = this;
switch (_that) {
case _SingboxOutboundGroupItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxOutboundGroupItem value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxOutboundGroupItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag, @JsonKey(fromJson: _typeFromJson)  ProxyType type,  int urlTestDelay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxOutboundGroupItem() when $default != null:
return $default(_that.tag,_that.type,_that.urlTestDelay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag, @JsonKey(fromJson: _typeFromJson)  ProxyType type,  int urlTestDelay)  $default,) {final _that = this;
switch (_that) {
case _SingboxOutboundGroupItem():
return $default(_that.tag,_that.type,_that.urlTestDelay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag, @JsonKey(fromJson: _typeFromJson)  ProxyType type,  int urlTestDelay)?  $default,) {final _that = this;
switch (_that) {
case _SingboxOutboundGroupItem() when $default != null:
return $default(_that.tag,_that.type,_that.urlTestDelay);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxOutboundGroupItem extends SingboxOutboundGroupItem {
  const _SingboxOutboundGroupItem({required this.tag, @JsonKey(fromJson: _typeFromJson) required this.type, required this.urlTestDelay}): super._();
  factory _SingboxOutboundGroupItem.fromJson(Map<String, dynamic> json) => _$SingboxOutboundGroupItemFromJson(json);

@override final  String tag;
@override@JsonKey(fromJson: _typeFromJson) final  ProxyType type;
@override final  int urlTestDelay;

/// Create a copy of SingboxOutboundGroupItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxOutboundGroupItemCopyWith<_SingboxOutboundGroupItem> get copyWith => __$SingboxOutboundGroupItemCopyWithImpl<_SingboxOutboundGroupItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxOutboundGroupItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxOutboundGroupItem&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.type, type) || other.type == type)&&(identical(other.urlTestDelay, urlTestDelay) || other.urlTestDelay == urlTestDelay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tag,type,urlTestDelay);

@override
String toString() {
  return 'SingboxOutboundGroupItem(tag: $tag, type: $type, urlTestDelay: $urlTestDelay)';
}


}

/// @nodoc
abstract mixin class _$SingboxOutboundGroupItemCopyWith<$Res> implements $SingboxOutboundGroupItemCopyWith<$Res> {
  factory _$SingboxOutboundGroupItemCopyWith(_SingboxOutboundGroupItem value, $Res Function(_SingboxOutboundGroupItem) _then) = __$SingboxOutboundGroupItemCopyWithImpl;
@override @useResult
$Res call({
 String tag,@JsonKey(fromJson: _typeFromJson) ProxyType type, int urlTestDelay
});




}
/// @nodoc
class __$SingboxOutboundGroupItemCopyWithImpl<$Res>
    implements _$SingboxOutboundGroupItemCopyWith<$Res> {
  __$SingboxOutboundGroupItemCopyWithImpl(this._self, this._then);

  final _SingboxOutboundGroupItem _self;
  final $Res Function(_SingboxOutboundGroupItem) _then;

/// Create a copy of SingboxOutboundGroupItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? type = null,Object? urlTestDelay = null,}) {
  return _then(_SingboxOutboundGroupItem(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxyType,urlTestDelay: null == urlTestDelay ? _self.urlTestDelay : urlTestDelay // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
