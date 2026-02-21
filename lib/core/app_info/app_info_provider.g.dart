// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(environment)
final environmentProvider = EnvironmentProvider._();

final class EnvironmentProvider
    extends $FunctionalProvider<Environment, Environment, Environment>
    with $Provider<Environment> {
  EnvironmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'environmentProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$environmentHash();

  @$internal
  @override
  $ProviderElement<Environment> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Environment create(Ref ref) {
    return environment(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Environment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Environment>(value),
    );
  }
}

String _$environmentHash() => r'd1e201bd9dbdf6c8c678e3e7df1d44c9a00a7ec6';

@ProviderFor(AppInfo)
final appInfoProvider = AppInfoProvider._();

final class AppInfoProvider
    extends $AsyncNotifierProvider<AppInfo, AppInfoEntity> {
  AppInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInfoHash();

  @$internal
  @override
  AppInfo create() => AppInfo();
}

String _$appInfoHash() => r'3b38faaff64bbb42e345d40cfdba5dffb7b04591';

abstract class _$AppInfo extends $AsyncNotifier<AppInfoEntity> {
  FutureOr<AppInfoEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppInfoEntity>, AppInfoEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppInfoEntity>, AppInfoEntity>,
              AsyncValue<AppInfoEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
