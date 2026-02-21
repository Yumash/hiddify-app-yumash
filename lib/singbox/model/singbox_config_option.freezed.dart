// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singbox_config_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingboxConfigOption {

 String get region; bool get blockAds; bool get useXrayCoreWhenPossible; bool get executeConfigAsIs; LogLevel get logLevel; bool get resolveDestination; String get remoteDnsAddress; DomainStrategy get remoteDnsDomainStrategy; String get directDnsAddress; DomainStrategy get directDnsDomainStrategy; int get mixedPort; int get tproxyPort; int get localDnsPort; TunImplementation get tunImplementation; int get mtu; bool get strictRoute; String get tunAddress; String get connectionTestUrl;@IntervalInSecondsConverter() Duration get urlTestInterval; bool get enableTun; bool get enableTunService; bool get setSystemProxy; bool get bypassLan; String get lanBypassIps; bool get allowConnectionFromLan; String get excludedDomains; String get excludedIps; String get excludedProcesses; bool get bypassRussianDomains; bool get bypassRussianIps; String get blockAdsRuleSetUrls; String get russianGeositeUrl; String get russianGeoipUrl;@IntervalInSecondsConverter() Duration get ruleSetUpdateInterval; bool get enableFakeDns; bool get enableDnsRouting; bool get independentDnsCache; List<SingboxRule> get rules; SingboxMuxOption get mux; SingboxTlsTricks get tlsTricks;// WireGuard LAN Server
 bool get wgServerEnabled; int get wgServerPort; String get wgServerSubnet; String get wgServerPrivateKey; String get wgServerPublicKey; String get wgClientPrivateKey; String get wgClientPublicKey;
/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxConfigOptionCopyWith<SingboxConfigOption> get copyWith => _$SingboxConfigOptionCopyWithImpl<SingboxConfigOption>(this as SingboxConfigOption, _$identity);

  /// Serializes this SingboxConfigOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxConfigOption&&(identical(other.region, region) || other.region == region)&&(identical(other.blockAds, blockAds) || other.blockAds == blockAds)&&(identical(other.useXrayCoreWhenPossible, useXrayCoreWhenPossible) || other.useXrayCoreWhenPossible == useXrayCoreWhenPossible)&&(identical(other.executeConfigAsIs, executeConfigAsIs) || other.executeConfigAsIs == executeConfigAsIs)&&(identical(other.logLevel, logLevel) || other.logLevel == logLevel)&&(identical(other.resolveDestination, resolveDestination) || other.resolveDestination == resolveDestination)&&(identical(other.remoteDnsAddress, remoteDnsAddress) || other.remoteDnsAddress == remoteDnsAddress)&&(identical(other.remoteDnsDomainStrategy, remoteDnsDomainStrategy) || other.remoteDnsDomainStrategy == remoteDnsDomainStrategy)&&(identical(other.directDnsAddress, directDnsAddress) || other.directDnsAddress == directDnsAddress)&&(identical(other.directDnsDomainStrategy, directDnsDomainStrategy) || other.directDnsDomainStrategy == directDnsDomainStrategy)&&(identical(other.mixedPort, mixedPort) || other.mixedPort == mixedPort)&&(identical(other.tproxyPort, tproxyPort) || other.tproxyPort == tproxyPort)&&(identical(other.localDnsPort, localDnsPort) || other.localDnsPort == localDnsPort)&&(identical(other.tunImplementation, tunImplementation) || other.tunImplementation == tunImplementation)&&(identical(other.mtu, mtu) || other.mtu == mtu)&&(identical(other.strictRoute, strictRoute) || other.strictRoute == strictRoute)&&(identical(other.tunAddress, tunAddress) || other.tunAddress == tunAddress)&&(identical(other.connectionTestUrl, connectionTestUrl) || other.connectionTestUrl == connectionTestUrl)&&(identical(other.urlTestInterval, urlTestInterval) || other.urlTestInterval == urlTestInterval)&&(identical(other.enableTun, enableTun) || other.enableTun == enableTun)&&(identical(other.enableTunService, enableTunService) || other.enableTunService == enableTunService)&&(identical(other.setSystemProxy, setSystemProxy) || other.setSystemProxy == setSystemProxy)&&(identical(other.bypassLan, bypassLan) || other.bypassLan == bypassLan)&&(identical(other.lanBypassIps, lanBypassIps) || other.lanBypassIps == lanBypassIps)&&(identical(other.allowConnectionFromLan, allowConnectionFromLan) || other.allowConnectionFromLan == allowConnectionFromLan)&&(identical(other.excludedDomains, excludedDomains) || other.excludedDomains == excludedDomains)&&(identical(other.excludedIps, excludedIps) || other.excludedIps == excludedIps)&&(identical(other.excludedProcesses, excludedProcesses) || other.excludedProcesses == excludedProcesses)&&(identical(other.bypassRussianDomains, bypassRussianDomains) || other.bypassRussianDomains == bypassRussianDomains)&&(identical(other.bypassRussianIps, bypassRussianIps) || other.bypassRussianIps == bypassRussianIps)&&(identical(other.blockAdsRuleSetUrls, blockAdsRuleSetUrls) || other.blockAdsRuleSetUrls == blockAdsRuleSetUrls)&&(identical(other.russianGeositeUrl, russianGeositeUrl) || other.russianGeositeUrl == russianGeositeUrl)&&(identical(other.russianGeoipUrl, russianGeoipUrl) || other.russianGeoipUrl == russianGeoipUrl)&&(identical(other.ruleSetUpdateInterval, ruleSetUpdateInterval) || other.ruleSetUpdateInterval == ruleSetUpdateInterval)&&(identical(other.enableFakeDns, enableFakeDns) || other.enableFakeDns == enableFakeDns)&&(identical(other.enableDnsRouting, enableDnsRouting) || other.enableDnsRouting == enableDnsRouting)&&(identical(other.independentDnsCache, independentDnsCache) || other.independentDnsCache == independentDnsCache)&&const DeepCollectionEquality().equals(other.rules, rules)&&(identical(other.mux, mux) || other.mux == mux)&&(identical(other.tlsTricks, tlsTricks) || other.tlsTricks == tlsTricks)&&(identical(other.wgServerEnabled, wgServerEnabled) || other.wgServerEnabled == wgServerEnabled)&&(identical(other.wgServerPort, wgServerPort) || other.wgServerPort == wgServerPort)&&(identical(other.wgServerSubnet, wgServerSubnet) || other.wgServerSubnet == wgServerSubnet)&&(identical(other.wgServerPrivateKey, wgServerPrivateKey) || other.wgServerPrivateKey == wgServerPrivateKey)&&(identical(other.wgServerPublicKey, wgServerPublicKey) || other.wgServerPublicKey == wgServerPublicKey)&&(identical(other.wgClientPrivateKey, wgClientPrivateKey) || other.wgClientPrivateKey == wgClientPrivateKey)&&(identical(other.wgClientPublicKey, wgClientPublicKey) || other.wgClientPublicKey == wgClientPublicKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,region,blockAds,useXrayCoreWhenPossible,executeConfigAsIs,logLevel,resolveDestination,remoteDnsAddress,remoteDnsDomainStrategy,directDnsAddress,directDnsDomainStrategy,mixedPort,tproxyPort,localDnsPort,tunImplementation,mtu,strictRoute,tunAddress,connectionTestUrl,urlTestInterval,enableTun,enableTunService,setSystemProxy,bypassLan,lanBypassIps,allowConnectionFromLan,excludedDomains,excludedIps,excludedProcesses,bypassRussianDomains,bypassRussianIps,blockAdsRuleSetUrls,russianGeositeUrl,russianGeoipUrl,ruleSetUpdateInterval,enableFakeDns,enableDnsRouting,independentDnsCache,const DeepCollectionEquality().hash(rules),mux,tlsTricks,wgServerEnabled,wgServerPort,wgServerSubnet,wgServerPrivateKey,wgServerPublicKey,wgClientPrivateKey,wgClientPublicKey]);

@override
String toString() {
  return 'SingboxConfigOption(region: $region, blockAds: $blockAds, useXrayCoreWhenPossible: $useXrayCoreWhenPossible, executeConfigAsIs: $executeConfigAsIs, logLevel: $logLevel, resolveDestination: $resolveDestination, remoteDnsAddress: $remoteDnsAddress, remoteDnsDomainStrategy: $remoteDnsDomainStrategy, directDnsAddress: $directDnsAddress, directDnsDomainStrategy: $directDnsDomainStrategy, mixedPort: $mixedPort, tproxyPort: $tproxyPort, localDnsPort: $localDnsPort, tunImplementation: $tunImplementation, mtu: $mtu, strictRoute: $strictRoute, tunAddress: $tunAddress, connectionTestUrl: $connectionTestUrl, urlTestInterval: $urlTestInterval, enableTun: $enableTun, enableTunService: $enableTunService, setSystemProxy: $setSystemProxy, bypassLan: $bypassLan, lanBypassIps: $lanBypassIps, allowConnectionFromLan: $allowConnectionFromLan, excludedDomains: $excludedDomains, excludedIps: $excludedIps, excludedProcesses: $excludedProcesses, bypassRussianDomains: $bypassRussianDomains, bypassRussianIps: $bypassRussianIps, blockAdsRuleSetUrls: $blockAdsRuleSetUrls, russianGeositeUrl: $russianGeositeUrl, russianGeoipUrl: $russianGeoipUrl, ruleSetUpdateInterval: $ruleSetUpdateInterval, enableFakeDns: $enableFakeDns, enableDnsRouting: $enableDnsRouting, independentDnsCache: $independentDnsCache, rules: $rules, mux: $mux, tlsTricks: $tlsTricks, wgServerEnabled: $wgServerEnabled, wgServerPort: $wgServerPort, wgServerSubnet: $wgServerSubnet, wgServerPrivateKey: $wgServerPrivateKey, wgServerPublicKey: $wgServerPublicKey, wgClientPrivateKey: $wgClientPrivateKey, wgClientPublicKey: $wgClientPublicKey)';
}


}

/// @nodoc
abstract mixin class $SingboxConfigOptionCopyWith<$Res>  {
  factory $SingboxConfigOptionCopyWith(SingboxConfigOption value, $Res Function(SingboxConfigOption) _then) = _$SingboxConfigOptionCopyWithImpl;
@useResult
$Res call({
 String region, bool blockAds, bool useXrayCoreWhenPossible, bool executeConfigAsIs, LogLevel logLevel, bool resolveDestination, String remoteDnsAddress, DomainStrategy remoteDnsDomainStrategy, String directDnsAddress, DomainStrategy directDnsDomainStrategy, int mixedPort, int tproxyPort, int localDnsPort, TunImplementation tunImplementation, int mtu, bool strictRoute, String tunAddress, String connectionTestUrl,@IntervalInSecondsConverter() Duration urlTestInterval, bool enableTun, bool enableTunService, bool setSystemProxy, bool bypassLan, String lanBypassIps, bool allowConnectionFromLan, String excludedDomains, String excludedIps, String excludedProcesses, bool bypassRussianDomains, bool bypassRussianIps, String blockAdsRuleSetUrls, String russianGeositeUrl, String russianGeoipUrl,@IntervalInSecondsConverter() Duration ruleSetUpdateInterval, bool enableFakeDns, bool enableDnsRouting, bool independentDnsCache, List<SingboxRule> rules, SingboxMuxOption mux, SingboxTlsTricks tlsTricks, bool wgServerEnabled, int wgServerPort, String wgServerSubnet, String wgServerPrivateKey, String wgServerPublicKey, String wgClientPrivateKey, String wgClientPublicKey
});


$SingboxMuxOptionCopyWith<$Res> get mux;$SingboxTlsTricksCopyWith<$Res> get tlsTricks;

}
/// @nodoc
class _$SingboxConfigOptionCopyWithImpl<$Res>
    implements $SingboxConfigOptionCopyWith<$Res> {
  _$SingboxConfigOptionCopyWithImpl(this._self, this._then);

  final SingboxConfigOption _self;
  final $Res Function(SingboxConfigOption) _then;

/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = null,Object? blockAds = null,Object? useXrayCoreWhenPossible = null,Object? executeConfigAsIs = null,Object? logLevel = null,Object? resolveDestination = null,Object? remoteDnsAddress = null,Object? remoteDnsDomainStrategy = null,Object? directDnsAddress = null,Object? directDnsDomainStrategy = null,Object? mixedPort = null,Object? tproxyPort = null,Object? localDnsPort = null,Object? tunImplementation = null,Object? mtu = null,Object? strictRoute = null,Object? tunAddress = null,Object? connectionTestUrl = null,Object? urlTestInterval = null,Object? enableTun = null,Object? enableTunService = null,Object? setSystemProxy = null,Object? bypassLan = null,Object? lanBypassIps = null,Object? allowConnectionFromLan = null,Object? excludedDomains = null,Object? excludedIps = null,Object? excludedProcesses = null,Object? bypassRussianDomains = null,Object? bypassRussianIps = null,Object? blockAdsRuleSetUrls = null,Object? russianGeositeUrl = null,Object? russianGeoipUrl = null,Object? ruleSetUpdateInterval = null,Object? enableFakeDns = null,Object? enableDnsRouting = null,Object? independentDnsCache = null,Object? rules = null,Object? mux = null,Object? tlsTricks = null,Object? wgServerEnabled = null,Object? wgServerPort = null,Object? wgServerSubnet = null,Object? wgServerPrivateKey = null,Object? wgServerPublicKey = null,Object? wgClientPrivateKey = null,Object? wgClientPublicKey = null,}) {
  return _then(_self.copyWith(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,blockAds: null == blockAds ? _self.blockAds : blockAds // ignore: cast_nullable_to_non_nullable
as bool,useXrayCoreWhenPossible: null == useXrayCoreWhenPossible ? _self.useXrayCoreWhenPossible : useXrayCoreWhenPossible // ignore: cast_nullable_to_non_nullable
as bool,executeConfigAsIs: null == executeConfigAsIs ? _self.executeConfigAsIs : executeConfigAsIs // ignore: cast_nullable_to_non_nullable
as bool,logLevel: null == logLevel ? _self.logLevel : logLevel // ignore: cast_nullable_to_non_nullable
as LogLevel,resolveDestination: null == resolveDestination ? _self.resolveDestination : resolveDestination // ignore: cast_nullable_to_non_nullable
as bool,remoteDnsAddress: null == remoteDnsAddress ? _self.remoteDnsAddress : remoteDnsAddress // ignore: cast_nullable_to_non_nullable
as String,remoteDnsDomainStrategy: null == remoteDnsDomainStrategy ? _self.remoteDnsDomainStrategy : remoteDnsDomainStrategy // ignore: cast_nullable_to_non_nullable
as DomainStrategy,directDnsAddress: null == directDnsAddress ? _self.directDnsAddress : directDnsAddress // ignore: cast_nullable_to_non_nullable
as String,directDnsDomainStrategy: null == directDnsDomainStrategy ? _self.directDnsDomainStrategy : directDnsDomainStrategy // ignore: cast_nullable_to_non_nullable
as DomainStrategy,mixedPort: null == mixedPort ? _self.mixedPort : mixedPort // ignore: cast_nullable_to_non_nullable
as int,tproxyPort: null == tproxyPort ? _self.tproxyPort : tproxyPort // ignore: cast_nullable_to_non_nullable
as int,localDnsPort: null == localDnsPort ? _self.localDnsPort : localDnsPort // ignore: cast_nullable_to_non_nullable
as int,tunImplementation: null == tunImplementation ? _self.tunImplementation : tunImplementation // ignore: cast_nullable_to_non_nullable
as TunImplementation,mtu: null == mtu ? _self.mtu : mtu // ignore: cast_nullable_to_non_nullable
as int,strictRoute: null == strictRoute ? _self.strictRoute : strictRoute // ignore: cast_nullable_to_non_nullable
as bool,tunAddress: null == tunAddress ? _self.tunAddress : tunAddress // ignore: cast_nullable_to_non_nullable
as String,connectionTestUrl: null == connectionTestUrl ? _self.connectionTestUrl : connectionTestUrl // ignore: cast_nullable_to_non_nullable
as String,urlTestInterval: null == urlTestInterval ? _self.urlTestInterval : urlTestInterval // ignore: cast_nullable_to_non_nullable
as Duration,enableTun: null == enableTun ? _self.enableTun : enableTun // ignore: cast_nullable_to_non_nullable
as bool,enableTunService: null == enableTunService ? _self.enableTunService : enableTunService // ignore: cast_nullable_to_non_nullable
as bool,setSystemProxy: null == setSystemProxy ? _self.setSystemProxy : setSystemProxy // ignore: cast_nullable_to_non_nullable
as bool,bypassLan: null == bypassLan ? _self.bypassLan : bypassLan // ignore: cast_nullable_to_non_nullable
as bool,lanBypassIps: null == lanBypassIps ? _self.lanBypassIps : lanBypassIps // ignore: cast_nullable_to_non_nullable
as String,allowConnectionFromLan: null == allowConnectionFromLan ? _self.allowConnectionFromLan : allowConnectionFromLan // ignore: cast_nullable_to_non_nullable
as bool,excludedDomains: null == excludedDomains ? _self.excludedDomains : excludedDomains // ignore: cast_nullable_to_non_nullable
as String,excludedIps: null == excludedIps ? _self.excludedIps : excludedIps // ignore: cast_nullable_to_non_nullable
as String,excludedProcesses: null == excludedProcesses ? _self.excludedProcesses : excludedProcesses // ignore: cast_nullable_to_non_nullable
as String,bypassRussianDomains: null == bypassRussianDomains ? _self.bypassRussianDomains : bypassRussianDomains // ignore: cast_nullable_to_non_nullable
as bool,bypassRussianIps: null == bypassRussianIps ? _self.bypassRussianIps : bypassRussianIps // ignore: cast_nullable_to_non_nullable
as bool,blockAdsRuleSetUrls: null == blockAdsRuleSetUrls ? _self.blockAdsRuleSetUrls : blockAdsRuleSetUrls // ignore: cast_nullable_to_non_nullable
as String,russianGeositeUrl: null == russianGeositeUrl ? _self.russianGeositeUrl : russianGeositeUrl // ignore: cast_nullable_to_non_nullable
as String,russianGeoipUrl: null == russianGeoipUrl ? _self.russianGeoipUrl : russianGeoipUrl // ignore: cast_nullable_to_non_nullable
as String,ruleSetUpdateInterval: null == ruleSetUpdateInterval ? _self.ruleSetUpdateInterval : ruleSetUpdateInterval // ignore: cast_nullable_to_non_nullable
as Duration,enableFakeDns: null == enableFakeDns ? _self.enableFakeDns : enableFakeDns // ignore: cast_nullable_to_non_nullable
as bool,enableDnsRouting: null == enableDnsRouting ? _self.enableDnsRouting : enableDnsRouting // ignore: cast_nullable_to_non_nullable
as bool,independentDnsCache: null == independentDnsCache ? _self.independentDnsCache : independentDnsCache // ignore: cast_nullable_to_non_nullable
as bool,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<SingboxRule>,mux: null == mux ? _self.mux : mux // ignore: cast_nullable_to_non_nullable
as SingboxMuxOption,tlsTricks: null == tlsTricks ? _self.tlsTricks : tlsTricks // ignore: cast_nullable_to_non_nullable
as SingboxTlsTricks,wgServerEnabled: null == wgServerEnabled ? _self.wgServerEnabled : wgServerEnabled // ignore: cast_nullable_to_non_nullable
as bool,wgServerPort: null == wgServerPort ? _self.wgServerPort : wgServerPort // ignore: cast_nullable_to_non_nullable
as int,wgServerSubnet: null == wgServerSubnet ? _self.wgServerSubnet : wgServerSubnet // ignore: cast_nullable_to_non_nullable
as String,wgServerPrivateKey: null == wgServerPrivateKey ? _self.wgServerPrivateKey : wgServerPrivateKey // ignore: cast_nullable_to_non_nullable
as String,wgServerPublicKey: null == wgServerPublicKey ? _self.wgServerPublicKey : wgServerPublicKey // ignore: cast_nullable_to_non_nullable
as String,wgClientPrivateKey: null == wgClientPrivateKey ? _self.wgClientPrivateKey : wgClientPrivateKey // ignore: cast_nullable_to_non_nullable
as String,wgClientPublicKey: null == wgClientPublicKey ? _self.wgClientPublicKey : wgClientPublicKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SingboxMuxOptionCopyWith<$Res> get mux {
  
  return $SingboxMuxOptionCopyWith<$Res>(_self.mux, (value) {
    return _then(_self.copyWith(mux: value));
  });
}/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SingboxTlsTricksCopyWith<$Res> get tlsTricks {
  
  return $SingboxTlsTricksCopyWith<$Res>(_self.tlsTricks, (value) {
    return _then(_self.copyWith(tlsTricks: value));
  });
}
}


/// Adds pattern-matching-related methods to [SingboxConfigOption].
extension SingboxConfigOptionPatterns on SingboxConfigOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxConfigOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxConfigOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxConfigOption value)  $default,){
final _that = this;
switch (_that) {
case _SingboxConfigOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxConfigOption value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxConfigOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String region,  bool blockAds,  bool useXrayCoreWhenPossible,  bool executeConfigAsIs,  LogLevel logLevel,  bool resolveDestination,  String remoteDnsAddress,  DomainStrategy remoteDnsDomainStrategy,  String directDnsAddress,  DomainStrategy directDnsDomainStrategy,  int mixedPort,  int tproxyPort,  int localDnsPort,  TunImplementation tunImplementation,  int mtu,  bool strictRoute,  String tunAddress,  String connectionTestUrl, @IntervalInSecondsConverter()  Duration urlTestInterval,  bool enableTun,  bool enableTunService,  bool setSystemProxy,  bool bypassLan,  String lanBypassIps,  bool allowConnectionFromLan,  String excludedDomains,  String excludedIps,  String excludedProcesses,  bool bypassRussianDomains,  bool bypassRussianIps,  String blockAdsRuleSetUrls,  String russianGeositeUrl,  String russianGeoipUrl, @IntervalInSecondsConverter()  Duration ruleSetUpdateInterval,  bool enableFakeDns,  bool enableDnsRouting,  bool independentDnsCache,  List<SingboxRule> rules,  SingboxMuxOption mux,  SingboxTlsTricks tlsTricks,  bool wgServerEnabled,  int wgServerPort,  String wgServerSubnet,  String wgServerPrivateKey,  String wgServerPublicKey,  String wgClientPrivateKey,  String wgClientPublicKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxConfigOption() when $default != null:
return $default(_that.region,_that.blockAds,_that.useXrayCoreWhenPossible,_that.executeConfigAsIs,_that.logLevel,_that.resolveDestination,_that.remoteDnsAddress,_that.remoteDnsDomainStrategy,_that.directDnsAddress,_that.directDnsDomainStrategy,_that.mixedPort,_that.tproxyPort,_that.localDnsPort,_that.tunImplementation,_that.mtu,_that.strictRoute,_that.tunAddress,_that.connectionTestUrl,_that.urlTestInterval,_that.enableTun,_that.enableTunService,_that.setSystemProxy,_that.bypassLan,_that.lanBypassIps,_that.allowConnectionFromLan,_that.excludedDomains,_that.excludedIps,_that.excludedProcesses,_that.bypassRussianDomains,_that.bypassRussianIps,_that.blockAdsRuleSetUrls,_that.russianGeositeUrl,_that.russianGeoipUrl,_that.ruleSetUpdateInterval,_that.enableFakeDns,_that.enableDnsRouting,_that.independentDnsCache,_that.rules,_that.mux,_that.tlsTricks,_that.wgServerEnabled,_that.wgServerPort,_that.wgServerSubnet,_that.wgServerPrivateKey,_that.wgServerPublicKey,_that.wgClientPrivateKey,_that.wgClientPublicKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String region,  bool blockAds,  bool useXrayCoreWhenPossible,  bool executeConfigAsIs,  LogLevel logLevel,  bool resolveDestination,  String remoteDnsAddress,  DomainStrategy remoteDnsDomainStrategy,  String directDnsAddress,  DomainStrategy directDnsDomainStrategy,  int mixedPort,  int tproxyPort,  int localDnsPort,  TunImplementation tunImplementation,  int mtu,  bool strictRoute,  String tunAddress,  String connectionTestUrl, @IntervalInSecondsConverter()  Duration urlTestInterval,  bool enableTun,  bool enableTunService,  bool setSystemProxy,  bool bypassLan,  String lanBypassIps,  bool allowConnectionFromLan,  String excludedDomains,  String excludedIps,  String excludedProcesses,  bool bypassRussianDomains,  bool bypassRussianIps,  String blockAdsRuleSetUrls,  String russianGeositeUrl,  String russianGeoipUrl, @IntervalInSecondsConverter()  Duration ruleSetUpdateInterval,  bool enableFakeDns,  bool enableDnsRouting,  bool independentDnsCache,  List<SingboxRule> rules,  SingboxMuxOption mux,  SingboxTlsTricks tlsTricks,  bool wgServerEnabled,  int wgServerPort,  String wgServerSubnet,  String wgServerPrivateKey,  String wgServerPublicKey,  String wgClientPrivateKey,  String wgClientPublicKey)  $default,) {final _that = this;
switch (_that) {
case _SingboxConfigOption():
return $default(_that.region,_that.blockAds,_that.useXrayCoreWhenPossible,_that.executeConfigAsIs,_that.logLevel,_that.resolveDestination,_that.remoteDnsAddress,_that.remoteDnsDomainStrategy,_that.directDnsAddress,_that.directDnsDomainStrategy,_that.mixedPort,_that.tproxyPort,_that.localDnsPort,_that.tunImplementation,_that.mtu,_that.strictRoute,_that.tunAddress,_that.connectionTestUrl,_that.urlTestInterval,_that.enableTun,_that.enableTunService,_that.setSystemProxy,_that.bypassLan,_that.lanBypassIps,_that.allowConnectionFromLan,_that.excludedDomains,_that.excludedIps,_that.excludedProcesses,_that.bypassRussianDomains,_that.bypassRussianIps,_that.blockAdsRuleSetUrls,_that.russianGeositeUrl,_that.russianGeoipUrl,_that.ruleSetUpdateInterval,_that.enableFakeDns,_that.enableDnsRouting,_that.independentDnsCache,_that.rules,_that.mux,_that.tlsTricks,_that.wgServerEnabled,_that.wgServerPort,_that.wgServerSubnet,_that.wgServerPrivateKey,_that.wgServerPublicKey,_that.wgClientPrivateKey,_that.wgClientPublicKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String region,  bool blockAds,  bool useXrayCoreWhenPossible,  bool executeConfigAsIs,  LogLevel logLevel,  bool resolveDestination,  String remoteDnsAddress,  DomainStrategy remoteDnsDomainStrategy,  String directDnsAddress,  DomainStrategy directDnsDomainStrategy,  int mixedPort,  int tproxyPort,  int localDnsPort,  TunImplementation tunImplementation,  int mtu,  bool strictRoute,  String tunAddress,  String connectionTestUrl, @IntervalInSecondsConverter()  Duration urlTestInterval,  bool enableTun,  bool enableTunService,  bool setSystemProxy,  bool bypassLan,  String lanBypassIps,  bool allowConnectionFromLan,  String excludedDomains,  String excludedIps,  String excludedProcesses,  bool bypassRussianDomains,  bool bypassRussianIps,  String blockAdsRuleSetUrls,  String russianGeositeUrl,  String russianGeoipUrl, @IntervalInSecondsConverter()  Duration ruleSetUpdateInterval,  bool enableFakeDns,  bool enableDnsRouting,  bool independentDnsCache,  List<SingboxRule> rules,  SingboxMuxOption mux,  SingboxTlsTricks tlsTricks,  bool wgServerEnabled,  int wgServerPort,  String wgServerSubnet,  String wgServerPrivateKey,  String wgServerPublicKey,  String wgClientPrivateKey,  String wgClientPublicKey)?  $default,) {final _that = this;
switch (_that) {
case _SingboxConfigOption() when $default != null:
return $default(_that.region,_that.blockAds,_that.useXrayCoreWhenPossible,_that.executeConfigAsIs,_that.logLevel,_that.resolveDestination,_that.remoteDnsAddress,_that.remoteDnsDomainStrategy,_that.directDnsAddress,_that.directDnsDomainStrategy,_that.mixedPort,_that.tproxyPort,_that.localDnsPort,_that.tunImplementation,_that.mtu,_that.strictRoute,_that.tunAddress,_that.connectionTestUrl,_that.urlTestInterval,_that.enableTun,_that.enableTunService,_that.setSystemProxy,_that.bypassLan,_that.lanBypassIps,_that.allowConnectionFromLan,_that.excludedDomains,_that.excludedIps,_that.excludedProcesses,_that.bypassRussianDomains,_that.bypassRussianIps,_that.blockAdsRuleSetUrls,_that.russianGeositeUrl,_that.russianGeoipUrl,_that.ruleSetUpdateInterval,_that.enableFakeDns,_that.enableDnsRouting,_that.independentDnsCache,_that.rules,_that.mux,_that.tlsTricks,_that.wgServerEnabled,_that.wgServerPort,_that.wgServerSubnet,_that.wgServerPrivateKey,_that.wgServerPublicKey,_that.wgClientPrivateKey,_that.wgClientPublicKey);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxConfigOption extends SingboxConfigOption {
  const _SingboxConfigOption({required this.region, required this.blockAds, required this.useXrayCoreWhenPossible, required this.executeConfigAsIs, required this.logLevel, required this.resolveDestination, required this.remoteDnsAddress, required this.remoteDnsDomainStrategy, required this.directDnsAddress, required this.directDnsDomainStrategy, required this.mixedPort, required this.tproxyPort, required this.localDnsPort, required this.tunImplementation, required this.mtu, required this.strictRoute, this.tunAddress = '100.64.1.1/28', required this.connectionTestUrl, @IntervalInSecondsConverter() required this.urlTestInterval, required this.enableTun, required this.enableTunService, required this.setSystemProxy, required this.bypassLan, this.lanBypassIps = '192.168.0.0/16,10.0.0.0/8,172.16.0.0/12', required this.allowConnectionFromLan, this.excludedDomains = '', this.excludedIps = '', this.excludedProcesses = '', this.bypassRussianDomains = false, this.bypassRussianIps = false, this.blockAdsRuleSetUrls = '', this.russianGeositeUrl = '', this.russianGeoipUrl = '', @IntervalInSecondsConverter() this.ruleSetUpdateInterval = const Duration(days: 7), required this.enableFakeDns, required this.enableDnsRouting, required this.independentDnsCache, required final  List<SingboxRule> rules, required this.mux, required this.tlsTricks, this.wgServerEnabled = false, this.wgServerPort = 51820, this.wgServerSubnet = '10.10.0.0/24', this.wgServerPrivateKey = '', this.wgServerPublicKey = '', this.wgClientPrivateKey = '', this.wgClientPublicKey = ''}): _rules = rules,super._();
  factory _SingboxConfigOption.fromJson(Map<String, dynamic> json) => _$SingboxConfigOptionFromJson(json);

@override final  String region;
@override final  bool blockAds;
@override final  bool useXrayCoreWhenPossible;
@override final  bool executeConfigAsIs;
@override final  LogLevel logLevel;
@override final  bool resolveDestination;
@override final  String remoteDnsAddress;
@override final  DomainStrategy remoteDnsDomainStrategy;
@override final  String directDnsAddress;
@override final  DomainStrategy directDnsDomainStrategy;
@override final  int mixedPort;
@override final  int tproxyPort;
@override final  int localDnsPort;
@override final  TunImplementation tunImplementation;
@override final  int mtu;
@override final  bool strictRoute;
@override@JsonKey() final  String tunAddress;
@override final  String connectionTestUrl;
@override@IntervalInSecondsConverter() final  Duration urlTestInterval;
@override final  bool enableTun;
@override final  bool enableTunService;
@override final  bool setSystemProxy;
@override final  bool bypassLan;
@override@JsonKey() final  String lanBypassIps;
@override final  bool allowConnectionFromLan;
@override@JsonKey() final  String excludedDomains;
@override@JsonKey() final  String excludedIps;
@override@JsonKey() final  String excludedProcesses;
@override@JsonKey() final  bool bypassRussianDomains;
@override@JsonKey() final  bool bypassRussianIps;
@override@JsonKey() final  String blockAdsRuleSetUrls;
@override@JsonKey() final  String russianGeositeUrl;
@override@JsonKey() final  String russianGeoipUrl;
@override@JsonKey()@IntervalInSecondsConverter() final  Duration ruleSetUpdateInterval;
@override final  bool enableFakeDns;
@override final  bool enableDnsRouting;
@override final  bool independentDnsCache;
 final  List<SingboxRule> _rules;
@override List<SingboxRule> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}

@override final  SingboxMuxOption mux;
@override final  SingboxTlsTricks tlsTricks;
// WireGuard LAN Server
@override@JsonKey() final  bool wgServerEnabled;
@override@JsonKey() final  int wgServerPort;
@override@JsonKey() final  String wgServerSubnet;
@override@JsonKey() final  String wgServerPrivateKey;
@override@JsonKey() final  String wgServerPublicKey;
@override@JsonKey() final  String wgClientPrivateKey;
@override@JsonKey() final  String wgClientPublicKey;

/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxConfigOptionCopyWith<_SingboxConfigOption> get copyWith => __$SingboxConfigOptionCopyWithImpl<_SingboxConfigOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxConfigOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxConfigOption&&(identical(other.region, region) || other.region == region)&&(identical(other.blockAds, blockAds) || other.blockAds == blockAds)&&(identical(other.useXrayCoreWhenPossible, useXrayCoreWhenPossible) || other.useXrayCoreWhenPossible == useXrayCoreWhenPossible)&&(identical(other.executeConfigAsIs, executeConfigAsIs) || other.executeConfigAsIs == executeConfigAsIs)&&(identical(other.logLevel, logLevel) || other.logLevel == logLevel)&&(identical(other.resolveDestination, resolveDestination) || other.resolveDestination == resolveDestination)&&(identical(other.remoteDnsAddress, remoteDnsAddress) || other.remoteDnsAddress == remoteDnsAddress)&&(identical(other.remoteDnsDomainStrategy, remoteDnsDomainStrategy) || other.remoteDnsDomainStrategy == remoteDnsDomainStrategy)&&(identical(other.directDnsAddress, directDnsAddress) || other.directDnsAddress == directDnsAddress)&&(identical(other.directDnsDomainStrategy, directDnsDomainStrategy) || other.directDnsDomainStrategy == directDnsDomainStrategy)&&(identical(other.mixedPort, mixedPort) || other.mixedPort == mixedPort)&&(identical(other.tproxyPort, tproxyPort) || other.tproxyPort == tproxyPort)&&(identical(other.localDnsPort, localDnsPort) || other.localDnsPort == localDnsPort)&&(identical(other.tunImplementation, tunImplementation) || other.tunImplementation == tunImplementation)&&(identical(other.mtu, mtu) || other.mtu == mtu)&&(identical(other.strictRoute, strictRoute) || other.strictRoute == strictRoute)&&(identical(other.tunAddress, tunAddress) || other.tunAddress == tunAddress)&&(identical(other.connectionTestUrl, connectionTestUrl) || other.connectionTestUrl == connectionTestUrl)&&(identical(other.urlTestInterval, urlTestInterval) || other.urlTestInterval == urlTestInterval)&&(identical(other.enableTun, enableTun) || other.enableTun == enableTun)&&(identical(other.enableTunService, enableTunService) || other.enableTunService == enableTunService)&&(identical(other.setSystemProxy, setSystemProxy) || other.setSystemProxy == setSystemProxy)&&(identical(other.bypassLan, bypassLan) || other.bypassLan == bypassLan)&&(identical(other.lanBypassIps, lanBypassIps) || other.lanBypassIps == lanBypassIps)&&(identical(other.allowConnectionFromLan, allowConnectionFromLan) || other.allowConnectionFromLan == allowConnectionFromLan)&&(identical(other.excludedDomains, excludedDomains) || other.excludedDomains == excludedDomains)&&(identical(other.excludedIps, excludedIps) || other.excludedIps == excludedIps)&&(identical(other.excludedProcesses, excludedProcesses) || other.excludedProcesses == excludedProcesses)&&(identical(other.bypassRussianDomains, bypassRussianDomains) || other.bypassRussianDomains == bypassRussianDomains)&&(identical(other.bypassRussianIps, bypassRussianIps) || other.bypassRussianIps == bypassRussianIps)&&(identical(other.blockAdsRuleSetUrls, blockAdsRuleSetUrls) || other.blockAdsRuleSetUrls == blockAdsRuleSetUrls)&&(identical(other.russianGeositeUrl, russianGeositeUrl) || other.russianGeositeUrl == russianGeositeUrl)&&(identical(other.russianGeoipUrl, russianGeoipUrl) || other.russianGeoipUrl == russianGeoipUrl)&&(identical(other.ruleSetUpdateInterval, ruleSetUpdateInterval) || other.ruleSetUpdateInterval == ruleSetUpdateInterval)&&(identical(other.enableFakeDns, enableFakeDns) || other.enableFakeDns == enableFakeDns)&&(identical(other.enableDnsRouting, enableDnsRouting) || other.enableDnsRouting == enableDnsRouting)&&(identical(other.independentDnsCache, independentDnsCache) || other.independentDnsCache == independentDnsCache)&&const DeepCollectionEquality().equals(other._rules, _rules)&&(identical(other.mux, mux) || other.mux == mux)&&(identical(other.tlsTricks, tlsTricks) || other.tlsTricks == tlsTricks)&&(identical(other.wgServerEnabled, wgServerEnabled) || other.wgServerEnabled == wgServerEnabled)&&(identical(other.wgServerPort, wgServerPort) || other.wgServerPort == wgServerPort)&&(identical(other.wgServerSubnet, wgServerSubnet) || other.wgServerSubnet == wgServerSubnet)&&(identical(other.wgServerPrivateKey, wgServerPrivateKey) || other.wgServerPrivateKey == wgServerPrivateKey)&&(identical(other.wgServerPublicKey, wgServerPublicKey) || other.wgServerPublicKey == wgServerPublicKey)&&(identical(other.wgClientPrivateKey, wgClientPrivateKey) || other.wgClientPrivateKey == wgClientPrivateKey)&&(identical(other.wgClientPublicKey, wgClientPublicKey) || other.wgClientPublicKey == wgClientPublicKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,region,blockAds,useXrayCoreWhenPossible,executeConfigAsIs,logLevel,resolveDestination,remoteDnsAddress,remoteDnsDomainStrategy,directDnsAddress,directDnsDomainStrategy,mixedPort,tproxyPort,localDnsPort,tunImplementation,mtu,strictRoute,tunAddress,connectionTestUrl,urlTestInterval,enableTun,enableTunService,setSystemProxy,bypassLan,lanBypassIps,allowConnectionFromLan,excludedDomains,excludedIps,excludedProcesses,bypassRussianDomains,bypassRussianIps,blockAdsRuleSetUrls,russianGeositeUrl,russianGeoipUrl,ruleSetUpdateInterval,enableFakeDns,enableDnsRouting,independentDnsCache,const DeepCollectionEquality().hash(_rules),mux,tlsTricks,wgServerEnabled,wgServerPort,wgServerSubnet,wgServerPrivateKey,wgServerPublicKey,wgClientPrivateKey,wgClientPublicKey]);

@override
String toString() {
  return 'SingboxConfigOption(region: $region, blockAds: $blockAds, useXrayCoreWhenPossible: $useXrayCoreWhenPossible, executeConfigAsIs: $executeConfigAsIs, logLevel: $logLevel, resolveDestination: $resolveDestination, remoteDnsAddress: $remoteDnsAddress, remoteDnsDomainStrategy: $remoteDnsDomainStrategy, directDnsAddress: $directDnsAddress, directDnsDomainStrategy: $directDnsDomainStrategy, mixedPort: $mixedPort, tproxyPort: $tproxyPort, localDnsPort: $localDnsPort, tunImplementation: $tunImplementation, mtu: $mtu, strictRoute: $strictRoute, tunAddress: $tunAddress, connectionTestUrl: $connectionTestUrl, urlTestInterval: $urlTestInterval, enableTun: $enableTun, enableTunService: $enableTunService, setSystemProxy: $setSystemProxy, bypassLan: $bypassLan, lanBypassIps: $lanBypassIps, allowConnectionFromLan: $allowConnectionFromLan, excludedDomains: $excludedDomains, excludedIps: $excludedIps, excludedProcesses: $excludedProcesses, bypassRussianDomains: $bypassRussianDomains, bypassRussianIps: $bypassRussianIps, blockAdsRuleSetUrls: $blockAdsRuleSetUrls, russianGeositeUrl: $russianGeositeUrl, russianGeoipUrl: $russianGeoipUrl, ruleSetUpdateInterval: $ruleSetUpdateInterval, enableFakeDns: $enableFakeDns, enableDnsRouting: $enableDnsRouting, independentDnsCache: $independentDnsCache, rules: $rules, mux: $mux, tlsTricks: $tlsTricks, wgServerEnabled: $wgServerEnabled, wgServerPort: $wgServerPort, wgServerSubnet: $wgServerSubnet, wgServerPrivateKey: $wgServerPrivateKey, wgServerPublicKey: $wgServerPublicKey, wgClientPrivateKey: $wgClientPrivateKey, wgClientPublicKey: $wgClientPublicKey)';
}


}

/// @nodoc
abstract mixin class _$SingboxConfigOptionCopyWith<$Res> implements $SingboxConfigOptionCopyWith<$Res> {
  factory _$SingboxConfigOptionCopyWith(_SingboxConfigOption value, $Res Function(_SingboxConfigOption) _then) = __$SingboxConfigOptionCopyWithImpl;
@override @useResult
$Res call({
 String region, bool blockAds, bool useXrayCoreWhenPossible, bool executeConfigAsIs, LogLevel logLevel, bool resolveDestination, String remoteDnsAddress, DomainStrategy remoteDnsDomainStrategy, String directDnsAddress, DomainStrategy directDnsDomainStrategy, int mixedPort, int tproxyPort, int localDnsPort, TunImplementation tunImplementation, int mtu, bool strictRoute, String tunAddress, String connectionTestUrl,@IntervalInSecondsConverter() Duration urlTestInterval, bool enableTun, bool enableTunService, bool setSystemProxy, bool bypassLan, String lanBypassIps, bool allowConnectionFromLan, String excludedDomains, String excludedIps, String excludedProcesses, bool bypassRussianDomains, bool bypassRussianIps, String blockAdsRuleSetUrls, String russianGeositeUrl, String russianGeoipUrl,@IntervalInSecondsConverter() Duration ruleSetUpdateInterval, bool enableFakeDns, bool enableDnsRouting, bool independentDnsCache, List<SingboxRule> rules, SingboxMuxOption mux, SingboxTlsTricks tlsTricks, bool wgServerEnabled, int wgServerPort, String wgServerSubnet, String wgServerPrivateKey, String wgServerPublicKey, String wgClientPrivateKey, String wgClientPublicKey
});


@override $SingboxMuxOptionCopyWith<$Res> get mux;@override $SingboxTlsTricksCopyWith<$Res> get tlsTricks;

}
/// @nodoc
class __$SingboxConfigOptionCopyWithImpl<$Res>
    implements _$SingboxConfigOptionCopyWith<$Res> {
  __$SingboxConfigOptionCopyWithImpl(this._self, this._then);

  final _SingboxConfigOption _self;
  final $Res Function(_SingboxConfigOption) _then;

/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = null,Object? blockAds = null,Object? useXrayCoreWhenPossible = null,Object? executeConfigAsIs = null,Object? logLevel = null,Object? resolveDestination = null,Object? remoteDnsAddress = null,Object? remoteDnsDomainStrategy = null,Object? directDnsAddress = null,Object? directDnsDomainStrategy = null,Object? mixedPort = null,Object? tproxyPort = null,Object? localDnsPort = null,Object? tunImplementation = null,Object? mtu = null,Object? strictRoute = null,Object? tunAddress = null,Object? connectionTestUrl = null,Object? urlTestInterval = null,Object? enableTun = null,Object? enableTunService = null,Object? setSystemProxy = null,Object? bypassLan = null,Object? lanBypassIps = null,Object? allowConnectionFromLan = null,Object? excludedDomains = null,Object? excludedIps = null,Object? excludedProcesses = null,Object? bypassRussianDomains = null,Object? bypassRussianIps = null,Object? blockAdsRuleSetUrls = null,Object? russianGeositeUrl = null,Object? russianGeoipUrl = null,Object? ruleSetUpdateInterval = null,Object? enableFakeDns = null,Object? enableDnsRouting = null,Object? independentDnsCache = null,Object? rules = null,Object? mux = null,Object? tlsTricks = null,Object? wgServerEnabled = null,Object? wgServerPort = null,Object? wgServerSubnet = null,Object? wgServerPrivateKey = null,Object? wgServerPublicKey = null,Object? wgClientPrivateKey = null,Object? wgClientPublicKey = null,}) {
  return _then(_SingboxConfigOption(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,blockAds: null == blockAds ? _self.blockAds : blockAds // ignore: cast_nullable_to_non_nullable
as bool,useXrayCoreWhenPossible: null == useXrayCoreWhenPossible ? _self.useXrayCoreWhenPossible : useXrayCoreWhenPossible // ignore: cast_nullable_to_non_nullable
as bool,executeConfigAsIs: null == executeConfigAsIs ? _self.executeConfigAsIs : executeConfigAsIs // ignore: cast_nullable_to_non_nullable
as bool,logLevel: null == logLevel ? _self.logLevel : logLevel // ignore: cast_nullable_to_non_nullable
as LogLevel,resolveDestination: null == resolveDestination ? _self.resolveDestination : resolveDestination // ignore: cast_nullable_to_non_nullable
as bool,remoteDnsAddress: null == remoteDnsAddress ? _self.remoteDnsAddress : remoteDnsAddress // ignore: cast_nullable_to_non_nullable
as String,remoteDnsDomainStrategy: null == remoteDnsDomainStrategy ? _self.remoteDnsDomainStrategy : remoteDnsDomainStrategy // ignore: cast_nullable_to_non_nullable
as DomainStrategy,directDnsAddress: null == directDnsAddress ? _self.directDnsAddress : directDnsAddress // ignore: cast_nullable_to_non_nullable
as String,directDnsDomainStrategy: null == directDnsDomainStrategy ? _self.directDnsDomainStrategy : directDnsDomainStrategy // ignore: cast_nullable_to_non_nullable
as DomainStrategy,mixedPort: null == mixedPort ? _self.mixedPort : mixedPort // ignore: cast_nullable_to_non_nullable
as int,tproxyPort: null == tproxyPort ? _self.tproxyPort : tproxyPort // ignore: cast_nullable_to_non_nullable
as int,localDnsPort: null == localDnsPort ? _self.localDnsPort : localDnsPort // ignore: cast_nullable_to_non_nullable
as int,tunImplementation: null == tunImplementation ? _self.tunImplementation : tunImplementation // ignore: cast_nullable_to_non_nullable
as TunImplementation,mtu: null == mtu ? _self.mtu : mtu // ignore: cast_nullable_to_non_nullable
as int,strictRoute: null == strictRoute ? _self.strictRoute : strictRoute // ignore: cast_nullable_to_non_nullable
as bool,tunAddress: null == tunAddress ? _self.tunAddress : tunAddress // ignore: cast_nullable_to_non_nullable
as String,connectionTestUrl: null == connectionTestUrl ? _self.connectionTestUrl : connectionTestUrl // ignore: cast_nullable_to_non_nullable
as String,urlTestInterval: null == urlTestInterval ? _self.urlTestInterval : urlTestInterval // ignore: cast_nullable_to_non_nullable
as Duration,enableTun: null == enableTun ? _self.enableTun : enableTun // ignore: cast_nullable_to_non_nullable
as bool,enableTunService: null == enableTunService ? _self.enableTunService : enableTunService // ignore: cast_nullable_to_non_nullable
as bool,setSystemProxy: null == setSystemProxy ? _self.setSystemProxy : setSystemProxy // ignore: cast_nullable_to_non_nullable
as bool,bypassLan: null == bypassLan ? _self.bypassLan : bypassLan // ignore: cast_nullable_to_non_nullable
as bool,lanBypassIps: null == lanBypassIps ? _self.lanBypassIps : lanBypassIps // ignore: cast_nullable_to_non_nullable
as String,allowConnectionFromLan: null == allowConnectionFromLan ? _self.allowConnectionFromLan : allowConnectionFromLan // ignore: cast_nullable_to_non_nullable
as bool,excludedDomains: null == excludedDomains ? _self.excludedDomains : excludedDomains // ignore: cast_nullable_to_non_nullable
as String,excludedIps: null == excludedIps ? _self.excludedIps : excludedIps // ignore: cast_nullable_to_non_nullable
as String,excludedProcesses: null == excludedProcesses ? _self.excludedProcesses : excludedProcesses // ignore: cast_nullable_to_non_nullable
as String,bypassRussianDomains: null == bypassRussianDomains ? _self.bypassRussianDomains : bypassRussianDomains // ignore: cast_nullable_to_non_nullable
as bool,bypassRussianIps: null == bypassRussianIps ? _self.bypassRussianIps : bypassRussianIps // ignore: cast_nullable_to_non_nullable
as bool,blockAdsRuleSetUrls: null == blockAdsRuleSetUrls ? _self.blockAdsRuleSetUrls : blockAdsRuleSetUrls // ignore: cast_nullable_to_non_nullable
as String,russianGeositeUrl: null == russianGeositeUrl ? _self.russianGeositeUrl : russianGeositeUrl // ignore: cast_nullable_to_non_nullable
as String,russianGeoipUrl: null == russianGeoipUrl ? _self.russianGeoipUrl : russianGeoipUrl // ignore: cast_nullable_to_non_nullable
as String,ruleSetUpdateInterval: null == ruleSetUpdateInterval ? _self.ruleSetUpdateInterval : ruleSetUpdateInterval // ignore: cast_nullable_to_non_nullable
as Duration,enableFakeDns: null == enableFakeDns ? _self.enableFakeDns : enableFakeDns // ignore: cast_nullable_to_non_nullable
as bool,enableDnsRouting: null == enableDnsRouting ? _self.enableDnsRouting : enableDnsRouting // ignore: cast_nullable_to_non_nullable
as bool,independentDnsCache: null == independentDnsCache ? _self.independentDnsCache : independentDnsCache // ignore: cast_nullable_to_non_nullable
as bool,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<SingboxRule>,mux: null == mux ? _self.mux : mux // ignore: cast_nullable_to_non_nullable
as SingboxMuxOption,tlsTricks: null == tlsTricks ? _self.tlsTricks : tlsTricks // ignore: cast_nullable_to_non_nullable
as SingboxTlsTricks,wgServerEnabled: null == wgServerEnabled ? _self.wgServerEnabled : wgServerEnabled // ignore: cast_nullable_to_non_nullable
as bool,wgServerPort: null == wgServerPort ? _self.wgServerPort : wgServerPort // ignore: cast_nullable_to_non_nullable
as int,wgServerSubnet: null == wgServerSubnet ? _self.wgServerSubnet : wgServerSubnet // ignore: cast_nullable_to_non_nullable
as String,wgServerPrivateKey: null == wgServerPrivateKey ? _self.wgServerPrivateKey : wgServerPrivateKey // ignore: cast_nullable_to_non_nullable
as String,wgServerPublicKey: null == wgServerPublicKey ? _self.wgServerPublicKey : wgServerPublicKey // ignore: cast_nullable_to_non_nullable
as String,wgClientPrivateKey: null == wgClientPrivateKey ? _self.wgClientPrivateKey : wgClientPrivateKey // ignore: cast_nullable_to_non_nullable
as String,wgClientPublicKey: null == wgClientPublicKey ? _self.wgClientPublicKey : wgClientPublicKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SingboxMuxOptionCopyWith<$Res> get mux {
  
  return $SingboxMuxOptionCopyWith<$Res>(_self.mux, (value) {
    return _then(_self.copyWith(mux: value));
  });
}/// Create a copy of SingboxConfigOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SingboxTlsTricksCopyWith<$Res> get tlsTricks {
  
  return $SingboxTlsTricksCopyWith<$Res>(_self.tlsTricks, (value) {
    return _then(_self.copyWith(tlsTricks: value));
  });
}
}


/// @nodoc
mixin _$SingboxMuxOption {

 bool get enable; bool get padding; int get maxStreams; MuxProtocol get protocol;
/// Create a copy of SingboxMuxOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxMuxOptionCopyWith<SingboxMuxOption> get copyWith => _$SingboxMuxOptionCopyWithImpl<SingboxMuxOption>(this as SingboxMuxOption, _$identity);

  /// Serializes this SingboxMuxOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxMuxOption&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.maxStreams, maxStreams) || other.maxStreams == maxStreams)&&(identical(other.protocol, protocol) || other.protocol == protocol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,padding,maxStreams,protocol);

@override
String toString() {
  return 'SingboxMuxOption(enable: $enable, padding: $padding, maxStreams: $maxStreams, protocol: $protocol)';
}


}

/// @nodoc
abstract mixin class $SingboxMuxOptionCopyWith<$Res>  {
  factory $SingboxMuxOptionCopyWith(SingboxMuxOption value, $Res Function(SingboxMuxOption) _then) = _$SingboxMuxOptionCopyWithImpl;
@useResult
$Res call({
 bool enable, bool padding, int maxStreams, MuxProtocol protocol
});




}
/// @nodoc
class _$SingboxMuxOptionCopyWithImpl<$Res>
    implements $SingboxMuxOptionCopyWith<$Res> {
  _$SingboxMuxOptionCopyWithImpl(this._self, this._then);

  final SingboxMuxOption _self;
  final $Res Function(SingboxMuxOption) _then;

/// Create a copy of SingboxMuxOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? padding = null,Object? maxStreams = null,Object? protocol = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as bool,maxStreams: null == maxStreams ? _self.maxStreams : maxStreams // ignore: cast_nullable_to_non_nullable
as int,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as MuxProtocol,
  ));
}

}


/// Adds pattern-matching-related methods to [SingboxMuxOption].
extension SingboxMuxOptionPatterns on SingboxMuxOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxMuxOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxMuxOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxMuxOption value)  $default,){
final _that = this;
switch (_that) {
case _SingboxMuxOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxMuxOption value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxMuxOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  bool padding,  int maxStreams,  MuxProtocol protocol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxMuxOption() when $default != null:
return $default(_that.enable,_that.padding,_that.maxStreams,_that.protocol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  bool padding,  int maxStreams,  MuxProtocol protocol)  $default,) {final _that = this;
switch (_that) {
case _SingboxMuxOption():
return $default(_that.enable,_that.padding,_that.maxStreams,_that.protocol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  bool padding,  int maxStreams,  MuxProtocol protocol)?  $default,) {final _that = this;
switch (_that) {
case _SingboxMuxOption() when $default != null:
return $default(_that.enable,_that.padding,_that.maxStreams,_that.protocol);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxMuxOption implements SingboxMuxOption {
  const _SingboxMuxOption({required this.enable, required this.padding, required this.maxStreams, required this.protocol});
  factory _SingboxMuxOption.fromJson(Map<String, dynamic> json) => _$SingboxMuxOptionFromJson(json);

@override final  bool enable;
@override final  bool padding;
@override final  int maxStreams;
@override final  MuxProtocol protocol;

/// Create a copy of SingboxMuxOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxMuxOptionCopyWith<_SingboxMuxOption> get copyWith => __$SingboxMuxOptionCopyWithImpl<_SingboxMuxOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxMuxOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxMuxOption&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.maxStreams, maxStreams) || other.maxStreams == maxStreams)&&(identical(other.protocol, protocol) || other.protocol == protocol));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,padding,maxStreams,protocol);

@override
String toString() {
  return 'SingboxMuxOption(enable: $enable, padding: $padding, maxStreams: $maxStreams, protocol: $protocol)';
}


}

/// @nodoc
abstract mixin class _$SingboxMuxOptionCopyWith<$Res> implements $SingboxMuxOptionCopyWith<$Res> {
  factory _$SingboxMuxOptionCopyWith(_SingboxMuxOption value, $Res Function(_SingboxMuxOption) _then) = __$SingboxMuxOptionCopyWithImpl;
@override @useResult
$Res call({
 bool enable, bool padding, int maxStreams, MuxProtocol protocol
});




}
/// @nodoc
class __$SingboxMuxOptionCopyWithImpl<$Res>
    implements _$SingboxMuxOptionCopyWith<$Res> {
  __$SingboxMuxOptionCopyWithImpl(this._self, this._then);

  final _SingboxMuxOption _self;
  final $Res Function(_SingboxMuxOption) _then;

/// Create a copy of SingboxMuxOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? padding = null,Object? maxStreams = null,Object? protocol = null,}) {
  return _then(_SingboxMuxOption(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as bool,maxStreams: null == maxStreams ? _self.maxStreams : maxStreams // ignore: cast_nullable_to_non_nullable
as int,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as MuxProtocol,
  ));
}


}


/// @nodoc
mixin _$SingboxTlsTricks {

 bool get enableFragment;@OptionalRangeJsonConverter() OptionalRange get fragmentSize;@OptionalRangeJsonConverter() OptionalRange get fragmentSleep; bool get mixedSniCase; bool get enablePadding;@OptionalRangeJsonConverter() OptionalRange get paddingSize;
/// Create a copy of SingboxTlsTricks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingboxTlsTricksCopyWith<SingboxTlsTricks> get copyWith => _$SingboxTlsTricksCopyWithImpl<SingboxTlsTricks>(this as SingboxTlsTricks, _$identity);

  /// Serializes this SingboxTlsTricks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingboxTlsTricks&&(identical(other.enableFragment, enableFragment) || other.enableFragment == enableFragment)&&(identical(other.fragmentSize, fragmentSize) || other.fragmentSize == fragmentSize)&&(identical(other.fragmentSleep, fragmentSleep) || other.fragmentSleep == fragmentSleep)&&(identical(other.mixedSniCase, mixedSniCase) || other.mixedSniCase == mixedSniCase)&&(identical(other.enablePadding, enablePadding) || other.enablePadding == enablePadding)&&(identical(other.paddingSize, paddingSize) || other.paddingSize == paddingSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableFragment,fragmentSize,fragmentSleep,mixedSniCase,enablePadding,paddingSize);

@override
String toString() {
  return 'SingboxTlsTricks(enableFragment: $enableFragment, fragmentSize: $fragmentSize, fragmentSleep: $fragmentSleep, mixedSniCase: $mixedSniCase, enablePadding: $enablePadding, paddingSize: $paddingSize)';
}


}

/// @nodoc
abstract mixin class $SingboxTlsTricksCopyWith<$Res>  {
  factory $SingboxTlsTricksCopyWith(SingboxTlsTricks value, $Res Function(SingboxTlsTricks) _then) = _$SingboxTlsTricksCopyWithImpl;
@useResult
$Res call({
 bool enableFragment,@OptionalRangeJsonConverter() OptionalRange fragmentSize,@OptionalRangeJsonConverter() OptionalRange fragmentSleep, bool mixedSniCase, bool enablePadding,@OptionalRangeJsonConverter() OptionalRange paddingSize
});




}
/// @nodoc
class _$SingboxTlsTricksCopyWithImpl<$Res>
    implements $SingboxTlsTricksCopyWith<$Res> {
  _$SingboxTlsTricksCopyWithImpl(this._self, this._then);

  final SingboxTlsTricks _self;
  final $Res Function(SingboxTlsTricks) _then;

/// Create a copy of SingboxTlsTricks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enableFragment = null,Object? fragmentSize = null,Object? fragmentSleep = null,Object? mixedSniCase = null,Object? enablePadding = null,Object? paddingSize = null,}) {
  return _then(_self.copyWith(
enableFragment: null == enableFragment ? _self.enableFragment : enableFragment // ignore: cast_nullable_to_non_nullable
as bool,fragmentSize: null == fragmentSize ? _self.fragmentSize : fragmentSize // ignore: cast_nullable_to_non_nullable
as OptionalRange,fragmentSleep: null == fragmentSleep ? _self.fragmentSleep : fragmentSleep // ignore: cast_nullable_to_non_nullable
as OptionalRange,mixedSniCase: null == mixedSniCase ? _self.mixedSniCase : mixedSniCase // ignore: cast_nullable_to_non_nullable
as bool,enablePadding: null == enablePadding ? _self.enablePadding : enablePadding // ignore: cast_nullable_to_non_nullable
as bool,paddingSize: null == paddingSize ? _self.paddingSize : paddingSize // ignore: cast_nullable_to_non_nullable
as OptionalRange,
  ));
}

}


/// Adds pattern-matching-related methods to [SingboxTlsTricks].
extension SingboxTlsTricksPatterns on SingboxTlsTricks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingboxTlsTricks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingboxTlsTricks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingboxTlsTricks value)  $default,){
final _that = this;
switch (_that) {
case _SingboxTlsTricks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingboxTlsTricks value)?  $default,){
final _that = this;
switch (_that) {
case _SingboxTlsTricks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enableFragment, @OptionalRangeJsonConverter()  OptionalRange fragmentSize, @OptionalRangeJsonConverter()  OptionalRange fragmentSleep,  bool mixedSniCase,  bool enablePadding, @OptionalRangeJsonConverter()  OptionalRange paddingSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingboxTlsTricks() when $default != null:
return $default(_that.enableFragment,_that.fragmentSize,_that.fragmentSleep,_that.mixedSniCase,_that.enablePadding,_that.paddingSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enableFragment, @OptionalRangeJsonConverter()  OptionalRange fragmentSize, @OptionalRangeJsonConverter()  OptionalRange fragmentSleep,  bool mixedSniCase,  bool enablePadding, @OptionalRangeJsonConverter()  OptionalRange paddingSize)  $default,) {final _that = this;
switch (_that) {
case _SingboxTlsTricks():
return $default(_that.enableFragment,_that.fragmentSize,_that.fragmentSleep,_that.mixedSniCase,_that.enablePadding,_that.paddingSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enableFragment, @OptionalRangeJsonConverter()  OptionalRange fragmentSize, @OptionalRangeJsonConverter()  OptionalRange fragmentSleep,  bool mixedSniCase,  bool enablePadding, @OptionalRangeJsonConverter()  OptionalRange paddingSize)?  $default,) {final _that = this;
switch (_that) {
case _SingboxTlsTricks() when $default != null:
return $default(_that.enableFragment,_that.fragmentSize,_that.fragmentSleep,_that.mixedSniCase,_that.enablePadding,_that.paddingSize);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.kebab)
class _SingboxTlsTricks implements SingboxTlsTricks {
  const _SingboxTlsTricks({required this.enableFragment, @OptionalRangeJsonConverter() required this.fragmentSize, @OptionalRangeJsonConverter() required this.fragmentSleep, required this.mixedSniCase, required this.enablePadding, @OptionalRangeJsonConverter() required this.paddingSize});
  factory _SingboxTlsTricks.fromJson(Map<String, dynamic> json) => _$SingboxTlsTricksFromJson(json);

@override final  bool enableFragment;
@override@OptionalRangeJsonConverter() final  OptionalRange fragmentSize;
@override@OptionalRangeJsonConverter() final  OptionalRange fragmentSleep;
@override final  bool mixedSniCase;
@override final  bool enablePadding;
@override@OptionalRangeJsonConverter() final  OptionalRange paddingSize;

/// Create a copy of SingboxTlsTricks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingboxTlsTricksCopyWith<_SingboxTlsTricks> get copyWith => __$SingboxTlsTricksCopyWithImpl<_SingboxTlsTricks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingboxTlsTricksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingboxTlsTricks&&(identical(other.enableFragment, enableFragment) || other.enableFragment == enableFragment)&&(identical(other.fragmentSize, fragmentSize) || other.fragmentSize == fragmentSize)&&(identical(other.fragmentSleep, fragmentSleep) || other.fragmentSleep == fragmentSleep)&&(identical(other.mixedSniCase, mixedSniCase) || other.mixedSniCase == mixedSniCase)&&(identical(other.enablePadding, enablePadding) || other.enablePadding == enablePadding)&&(identical(other.paddingSize, paddingSize) || other.paddingSize == paddingSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enableFragment,fragmentSize,fragmentSleep,mixedSniCase,enablePadding,paddingSize);

@override
String toString() {
  return 'SingboxTlsTricks(enableFragment: $enableFragment, fragmentSize: $fragmentSize, fragmentSleep: $fragmentSleep, mixedSniCase: $mixedSniCase, enablePadding: $enablePadding, paddingSize: $paddingSize)';
}


}

/// @nodoc
abstract mixin class _$SingboxTlsTricksCopyWith<$Res> implements $SingboxTlsTricksCopyWith<$Res> {
  factory _$SingboxTlsTricksCopyWith(_SingboxTlsTricks value, $Res Function(_SingboxTlsTricks) _then) = __$SingboxTlsTricksCopyWithImpl;
@override @useResult
$Res call({
 bool enableFragment,@OptionalRangeJsonConverter() OptionalRange fragmentSize,@OptionalRangeJsonConverter() OptionalRange fragmentSleep, bool mixedSniCase, bool enablePadding,@OptionalRangeJsonConverter() OptionalRange paddingSize
});




}
/// @nodoc
class __$SingboxTlsTricksCopyWithImpl<$Res>
    implements _$SingboxTlsTricksCopyWith<$Res> {
  __$SingboxTlsTricksCopyWithImpl(this._self, this._then);

  final _SingboxTlsTricks _self;
  final $Res Function(_SingboxTlsTricks) _then;

/// Create a copy of SingboxTlsTricks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enableFragment = null,Object? fragmentSize = null,Object? fragmentSleep = null,Object? mixedSniCase = null,Object? enablePadding = null,Object? paddingSize = null,}) {
  return _then(_SingboxTlsTricks(
enableFragment: null == enableFragment ? _self.enableFragment : enableFragment // ignore: cast_nullable_to_non_nullable
as bool,fragmentSize: null == fragmentSize ? _self.fragmentSize : fragmentSize // ignore: cast_nullable_to_non_nullable
as OptionalRange,fragmentSleep: null == fragmentSleep ? _self.fragmentSleep : fragmentSleep // ignore: cast_nullable_to_non_nullable
as OptionalRange,mixedSniCase: null == mixedSniCase ? _self.mixedSniCase : mixedSniCase // ignore: cast_nullable_to_non_nullable
as bool,enablePadding: null == enablePadding ? _self.enablePadding : enablePadding // ignore: cast_nullable_to_non_nullable
as bool,paddingSize: null == paddingSize ? _self.paddingSize : paddingSize // ignore: cast_nullable_to_non_nullable
as OptionalRange,
  ));
}


}

// dart format on
