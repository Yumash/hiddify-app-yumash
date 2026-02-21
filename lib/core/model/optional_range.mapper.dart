// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'optional_range.dart';

class OptionalRangeMapper extends ClassMapperBase<OptionalRange> {
  OptionalRangeMapper._();

  static OptionalRangeMapper? _instance;
  static OptionalRangeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OptionalRangeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OptionalRange';

  static int? _$min(OptionalRange v) => v.min;
  static const Field<OptionalRange, int> _f$min = Field(
    'min',
    _$min,
    opt: true,
  );
  static int? _$max(OptionalRange v) => v.max;
  static const Field<OptionalRange, int> _f$max = Field(
    'max',
    _$max,
    opt: true,
  );

  @override
  final MappableFields<OptionalRange> fields = const {
    #min: _f$min,
    #max: _f$max,
  };

  static OptionalRange _instantiate(DecodingData data) {
    return OptionalRange(min: data.dec(_f$min), max: data.dec(_f$max));
  }

  @override
  final Function instantiate = _instantiate;

  static OptionalRange fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OptionalRange>(map);
  }

  static OptionalRange fromJson(String json) {
    return ensureInitialized().decodeJson<OptionalRange>(json);
  }
}

mixin OptionalRangeMappable {
  String toJson() {
    return OptionalRangeMapper.ensureInitialized().encodeJson<OptionalRange>(
      this as OptionalRange,
    );
  }

  Map<String, dynamic> toMap() {
    return OptionalRangeMapper.ensureInitialized().encodeMap<OptionalRange>(
      this as OptionalRange,
    );
  }

  OptionalRangeCopyWith<OptionalRange, OptionalRange, OptionalRange>
  get copyWith => _OptionalRangeCopyWithImpl<OptionalRange, OptionalRange>(
    this as OptionalRange,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return OptionalRangeMapper.ensureInitialized().stringifyValue(
      this as OptionalRange,
    );
  }

  @override
  bool operator ==(Object other) {
    return OptionalRangeMapper.ensureInitialized().equalsValue(
      this as OptionalRange,
      other,
    );
  }

  @override
  int get hashCode {
    return OptionalRangeMapper.ensureInitialized().hashValue(
      this as OptionalRange,
    );
  }
}

extension OptionalRangeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OptionalRange, $Out> {
  OptionalRangeCopyWith<$R, OptionalRange, $Out> get $asOptionalRange =>
      $base.as((v, t, t2) => _OptionalRangeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OptionalRangeCopyWith<$R, $In extends OptionalRange, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? min, int? max});
  OptionalRangeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OptionalRangeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OptionalRange, $Out>
    implements OptionalRangeCopyWith<$R, OptionalRange, $Out> {
  _OptionalRangeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OptionalRange> $mapper =
      OptionalRangeMapper.ensureInitialized();
  @override
  $R call({Object? min = $none, Object? max = $none}) => $apply(
    FieldCopyWithData({
      if (min != $none) #min: min,
      if (max != $none) #max: max,
    }),
  );
  @override
  OptionalRange $make(CopyWithData data) => OptionalRange(
    min: data.get(#min, or: $value.min),
    max: data.get(#max, or: $value.max),
  );

  @override
  OptionalRangeCopyWith<$R2, OptionalRange, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OptionalRangeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

