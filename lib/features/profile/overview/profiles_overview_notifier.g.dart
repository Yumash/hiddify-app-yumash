// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles_overview_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfilesOverviewSortNotifier)
final profilesOverviewSortProvider = ProfilesOverviewSortNotifierProvider._();

final class ProfilesOverviewSortNotifierProvider
    extends
        $NotifierProvider<
          ProfilesOverviewSortNotifier,
          ({ProfilesSort by, SortMode mode})
        > {
  ProfilesOverviewSortNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profilesOverviewSortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profilesOverviewSortNotifierHash();

  @$internal
  @override
  ProfilesOverviewSortNotifier create() => ProfilesOverviewSortNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({ProfilesSort by, SortMode mode}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<({ProfilesSort by, SortMode mode})>(
        value,
      ),
    );
  }
}

String _$profilesOverviewSortNotifierHash() =>
    r'196c72eb7154ab04121c8a4ab8f609df633974f1';

abstract class _$ProfilesOverviewSortNotifier
    extends $Notifier<({ProfilesSort by, SortMode mode})> {
  ({ProfilesSort by, SortMode mode}) build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({ProfilesSort by, SortMode mode}),
              ({ProfilesSort by, SortMode mode})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({ProfilesSort by, SortMode mode}),
                ({ProfilesSort by, SortMode mode})
              >,
              ({ProfilesSort by, SortMode mode}),
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProfilesOverviewNotifier)
final profilesOverviewProvider = ProfilesOverviewNotifierProvider._();

final class ProfilesOverviewNotifierProvider
    extends
        $StreamNotifierProvider<ProfilesOverviewNotifier, List<ProfileEntity>> {
  ProfilesOverviewNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profilesOverviewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profilesOverviewNotifierHash();

  @$internal
  @override
  ProfilesOverviewNotifier create() => ProfilesOverviewNotifier();
}

String _$profilesOverviewNotifierHash() =>
    r'70ecea93d3e922b01b5ec2974537f7536817661a';

abstract class _$ProfilesOverviewNotifier
    extends $StreamNotifier<List<ProfileEntity>> {
  Stream<List<ProfileEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProfileEntity>>, List<ProfileEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProfileEntity>>, List<ProfileEntity>>,
              AsyncValue<List<ProfileEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
