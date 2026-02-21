// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ip_info_entity.dart';

class IpInfoMapper extends ClassMapperBase<IpInfo> {
  IpInfoMapper._();

  static IpInfoMapper? _instance;
  static IpInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IpInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IpInfo';

  static String _$ip(IpInfo v) => v.ip;
  static const Field<IpInfo, String> _f$ip = Field('ip', _$ip);
  static String _$countryCode(IpInfo v) => v.countryCode;
  static const Field<IpInfo, String> _f$countryCode = Field(
    'countryCode',
    _$countryCode,
  );
  static String? _$region(IpInfo v) => v.region;
  static const Field<IpInfo, String> _f$region = Field(
    'region',
    _$region,
    opt: true,
  );
  static String? _$city(IpInfo v) => v.city;
  static const Field<IpInfo, String> _f$city = Field('city', _$city, opt: true);
  static String? _$timezone(IpInfo v) => v.timezone;
  static const Field<IpInfo, String> _f$timezone = Field(
    'timezone',
    _$timezone,
    opt: true,
  );
  static String? _$asn(IpInfo v) => v.asn;
  static const Field<IpInfo, String> _f$asn = Field('asn', _$asn, opt: true);
  static String? _$org(IpInfo v) => v.org;
  static const Field<IpInfo, String> _f$org = Field('org', _$org, opt: true);

  @override
  final MappableFields<IpInfo> fields = const {
    #ip: _f$ip,
    #countryCode: _f$countryCode,
    #region: _f$region,
    #city: _f$city,
    #timezone: _f$timezone,
    #asn: _f$asn,
    #org: _f$org,
  };

  static IpInfo _instantiate(DecodingData data) {
    return IpInfo(
      ip: data.dec(_f$ip),
      countryCode: data.dec(_f$countryCode),
      region: data.dec(_f$region),
      city: data.dec(_f$city),
      timezone: data.dec(_f$timezone),
      asn: data.dec(_f$asn),
      org: data.dec(_f$org),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static IpInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IpInfo>(map);
  }

  static IpInfo fromJson(String json) {
    return ensureInitialized().decodeJson<IpInfo>(json);
  }
}

mixin IpInfoMappable {
  String toJson() {
    return IpInfoMapper.ensureInitialized().encodeJson<IpInfo>(this as IpInfo);
  }

  Map<String, dynamic> toMap() {
    return IpInfoMapper.ensureInitialized().encodeMap<IpInfo>(this as IpInfo);
  }

  IpInfoCopyWith<IpInfo, IpInfo, IpInfo> get copyWith =>
      _IpInfoCopyWithImpl<IpInfo, IpInfo>(this as IpInfo, $identity, $identity);
  @override
  String toString() {
    return IpInfoMapper.ensureInitialized().stringifyValue(this as IpInfo);
  }

  @override
  bool operator ==(Object other) {
    return IpInfoMapper.ensureInitialized().equalsValue(this as IpInfo, other);
  }

  @override
  int get hashCode {
    return IpInfoMapper.ensureInitialized().hashValue(this as IpInfo);
  }
}

extension IpInfoValueCopy<$R, $Out> on ObjectCopyWith<$R, IpInfo, $Out> {
  IpInfoCopyWith<$R, IpInfo, $Out> get $asIpInfo =>
      $base.as((v, t, t2) => _IpInfoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IpInfoCopyWith<$R, $In extends IpInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? ip,
    String? countryCode,
    String? region,
    String? city,
    String? timezone,
    String? asn,
    String? org,
  });
  IpInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IpInfoCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, IpInfo, $Out>
    implements IpInfoCopyWith<$R, IpInfo, $Out> {
  _IpInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IpInfo> $mapper = IpInfoMapper.ensureInitialized();
  @override
  $R call({
    String? ip,
    String? countryCode,
    Object? region = $none,
    Object? city = $none,
    Object? timezone = $none,
    Object? asn = $none,
    Object? org = $none,
  }) => $apply(
    FieldCopyWithData({
      if (ip != null) #ip: ip,
      if (countryCode != null) #countryCode: countryCode,
      if (region != $none) #region: region,
      if (city != $none) #city: city,
      if (timezone != $none) #timezone: timezone,
      if (asn != $none) #asn: asn,
      if (org != $none) #org: org,
    }),
  );
  @override
  IpInfo $make(CopyWithData data) => IpInfo(
    ip: data.get(#ip, or: $value.ip),
    countryCode: data.get(#countryCode, or: $value.countryCode),
    region: data.get(#region, or: $value.region),
    city: data.get(#city, or: $value.city),
    timezone: data.get(#timezone, or: $value.timezone),
    asn: data.get(#asn, or: $value.asn),
    org: data.get(#org, or: $value.org),
  );

  @override
  IpInfoCopyWith<$R2, IpInfo, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _IpInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

