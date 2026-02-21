// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_update_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ForegroundProfilesUpdateNotifier)
final foregroundProfilesUpdateProvider =
    ForegroundProfilesUpdateNotifierProvider._();

final class ForegroundProfilesUpdateNotifierProvider
    extends
        $StreamNotifierProvider<
          ForegroundProfilesUpdateNotifier,
          ProfileUpdateStatus?
        > {
  ForegroundProfilesUpdateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foregroundProfilesUpdateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foregroundProfilesUpdateNotifierHash();

  @$internal
  @override
  ForegroundProfilesUpdateNotifier create() =>
      ForegroundProfilesUpdateNotifier();
}

String _$foregroundProfilesUpdateNotifierHash() =>
    r'20980784c70fa3bf3fa0718a364ea04834ead0de';

abstract class _$ForegroundProfilesUpdateNotifier
    extends $StreamNotifier<ProfileUpdateStatus?> {
  Stream<ProfileUpdateStatus?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ProfileUpdateStatus?>, ProfileUpdateStatus?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ProfileUpdateStatus?>,
                ProfileUpdateStatus?
              >,
              AsyncValue<ProfileUpdateStatus?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
