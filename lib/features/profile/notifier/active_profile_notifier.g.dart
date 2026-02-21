// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveProfile)
final activeProfileProvider = ActiveProfileProvider._();

final class ActiveProfileProvider
    extends $StreamNotifierProvider<ActiveProfile, ProfileEntity?> {
  ActiveProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeProfileHash();

  @$internal
  @override
  ActiveProfile create() => ActiveProfile();
}

String _$activeProfileHash() => r'8dbce6f1e568ce38b175eb4d2f06f8b92b9d3f0f';

abstract class _$ActiveProfile extends $StreamNotifier<ProfileEntity?> {
  Stream<ProfileEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProfileEntity?>, ProfileEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileEntity?>, ProfileEntity?>,
              AsyncValue<ProfileEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
