// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singbox_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingboxRule {

 String? get ruleSetUrl; String? get domains; String? get ip; String? get port; String? get protocol; RuleNetwork get network; RuleOutbound get outbound;
/// Create a copy of SingboxRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxRuleCopyWith<SingboxRule> get copyWith => _$SingboxRuleCopyWithImpl<SingboxRule>(this as SingboxRule, _$identity);

  /// Serializes this SingboxRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxRule&&(identical(other.ruleSetUrl, ruleSetUrl) || other.ruleSetUrl == ruleSetUrl)&&(identical(other.domains, domains) || other.domains == domains)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.network, network) || other.network == network)&&(identical(other.outbound, outbound) || other.outbound == outbound));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ruleSetUrl,domains,ip,port,protocol,network,outbound);

@override
String toString() {
  return 'SingboxRule(ruleSetUrl: $ruleSetUrl, domains: $domains, ip: $ip, port: $port, protocol: $protocol, network: $network, outbound: $outbound)';
}


}

/// @nodoc
abstract mixin class $SingboxRuleCopyWith<$Res>  {
  factory $SingboxRuleCopyWith(SingboxRule value, $Res Function(SingboxRule) _then) = _$SingboxRuleCopyWithImpl;
@useResult
$Res call({
 String? ruleSetUrl, String? domains, String? ip, String? port, String? protocol, RuleNetwork network, RuleOutbound outbound
});




}
/// @nodoc
class _$SingboxRuleCopyWithImpl<$Res>
    implements $SingboxRuleCopyWith<$Res> {
  _$SingboxRuleCopyWithImpl(this._self, this._then);

  final SingboxRule _self;
  final $Res Function(SingboxRule) _then;

/// Create a copy of SingboxRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ruleSetUrl = freezed,Object? domains = freezed,Object? ip = freezed,Object? port = freezed,Object? protocol = freezed,Object? network = null,Object? outbound = null,}) {
  return _then(_self.copyWith(
ruleSetUrl: freezed == ruleSetUrl ? _self.ruleSetUrl : ruleSetUrl // ignore: cast_nullable_to_non_nullable
as String?,domains: freezed == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,protocol: freezed == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String?,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as RuleNetwork,outbound: null == outbound ? _self.outbound : outbound // ignore: cast_nullable_to_non_nullable
as RuleOutbound,
  ));
}

}


/// Adds pattern-matching-related methods to [SingboxRule].
extension SingboxRulePatterns on SingboxRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxRule value)  $default,){
final _that = this;
switch (_that) {
case _SingboxRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxRule value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? ruleSetUrl,  String? domains,  String? ip,  String? port,  String? protocol,  RuleNetwork network,  RuleOutbound outbound)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxRule() when $default != null:
return $default(_that.ruleSetUrl,_that.domains,_that.ip,_that.port,_that.protocol,_that.network,_that.outbound);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? ruleSetUrl,  String? domains,  String? ip,  String? port,  String? protocol,  RuleNetwork network,  RuleOutbound outbound)  $default,) {final _that = this;
switch (_that) {
case _SingboxRule():
return $default(_that.ruleSetUrl,_that.domains,_that.ip,_that.port,_that.protocol,_that.network,_that.outbound);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? ruleSetUrl,  String? domains,  String? ip,  String? port,  String? protocol,  RuleNetwork network,  RuleOutbound outbound)?  $default,) {final _that = this;
switch (_that) {
case _SingboxRule() when $default != null:
return $default(_that.ruleSetUrl,_that.domains,_that.ip,_that.port,_that.protocol,_that.network,_that.outbound);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxRule extends SingboxRule {
  const _SingboxRule({this.ruleSetUrl, this.domains, this.ip, this.port, this.protocol, this.network = RuleNetwork.tcpAndUdp, this.outbound = RuleOutbound.proxy}): super._();
  factory _SingboxRule.fromJson(Map<String, dynamic> json) => _$SingboxRuleFromJson(json);

@override final  String? ruleSetUrl;
@override final  String? domains;
@override final  String? ip;
@override final  String? port;
@override final  String? protocol;
@override@JsonKey() final  RuleNetwork network;
@override@JsonKey() final  RuleOutbound outbound;

/// Create a copy of SingboxRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxRuleCopyWith<_SingboxRule> get copyWith => __$SingboxRuleCopyWithImpl<_SingboxRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxRule&&(identical(other.ruleSetUrl, ruleSetUrl) || other.ruleSetUrl == ruleSetUrl)&&(identical(other.domains, domains) || other.domains == domains)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.network, network) || other.network == network)&&(identical(other.outbound, outbound) || other.outbound == outbound));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ruleSetUrl,domains,ip,port,protocol,network,outbound);

@override
String toString() {
  return 'SingboxRule(ruleSetUrl: $ruleSetUrl, domains: $domains, ip: $ip, port: $port, protocol: $protocol, network: $network, outbound: $outbound)';
}


}

/// @nodoc
abstract mixin class _$SingboxRuleCopyWith<$Res> implements $SingboxRuleCopyWith<$Res> {
  factory _$SingboxRuleCopyWith(_SingboxRule value, $Res Function(_SingboxRule) _then) = __$SingboxRuleCopyWithImpl;
@override @useResult
$Res call({
 String? ruleSetUrl, String? domains, String? ip, String? port, String? protocol, RuleNetwork network, RuleOutbound outbound
});




}
/// @nodoc
class __$SingboxRuleCopyWithImpl<$Res>
    implements _$SingboxRuleCopyWith<$Res> {
  __$SingboxRuleCopyWithImpl(this._self, this._then);

  final _SingboxRule _self;
  final $Res Function(_SingboxRule) _then;

/// Create a copy of SingboxRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ruleSetUrl = freezed,Object? domains = freezed,Object? ip = freezed,Object? port = freezed,Object? protocol = freezed,Object? network = null,Object? outbound = null,}) {
  return _then(_SingboxRule(
ruleSetUrl: freezed == ruleSetUrl ? _self.ruleSetUrl : ruleSetUrl // ignore: cast_nullable_to_non_nullable
as String?,domains: freezed == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,protocol: freezed == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as String?,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as RuleNetwork,outbound: null == outbound ? _self.outbound : outbound // ignore: cast_nullable_to_non_nullable
as RuleOutbound,
  ));
}


}

// dart format on
