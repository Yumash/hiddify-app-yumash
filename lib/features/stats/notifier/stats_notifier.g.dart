// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StatsNotifier)
final statsProvider = StatsNotifierProvider._();

final class StatsNotifierProvider
    extends $StreamNotifierProvider<StatsNotifier, StatsEntity> {
  StatsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statsNotifierHash();

  @$internal
  @override
  StatsNotifier create() => StatsNotifier();
}

String _$statsNotifierHash() => r'2b17c92f70b4411ae782f6c1f501d9a23f227bc5';

abstract class _$StatsNotifier extends $StreamNotifier<StatsEntity> {
  Stream<StatsEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<StatsEntity>, StatsEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<StatsEntity>, StatsEntity>,
              AsyncValue<StatsEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
