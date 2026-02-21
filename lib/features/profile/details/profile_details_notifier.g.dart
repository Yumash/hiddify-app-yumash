// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileDetailsNotifier)
final profileDetailsProvider = ProfileDetailsNotifierFamily._();

final class ProfileDetailsNotifierProvider
    extends
        $AsyncNotifierProvider<ProfileDetailsNotifier, ProfileDetailsState> {
  ProfileDetailsNotifierProvider._({
    required ProfileDetailsNotifierFamily super.from,
    required (String, {String? url, String? profileName}) super.argument,
  }) : super(
         retry: null,
         name: r'profileDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileDetailsNotifierHash();

  @override
  String toString() {
    return r'profileDetailsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProfileDetailsNotifier create() => ProfileDetailsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProfileDetailsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileDetailsNotifierHash() =>
    r'ef3ba8336cea05acefbf22ac305f00c16270f1d8';

final class ProfileDetailsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProfileDetailsNotifier,
          AsyncValue<ProfileDetailsState>,
          ProfileDetailsState,
          FutureOr<ProfileDetailsState>,
          (String, {String? url, String? profileName})
        > {
  ProfileDetailsNotifierFamily._()
    : super(
        retry: null,
        name: r'profileDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProfileDetailsNotifierProvider call(
    String id, {
    String? url,
    String? profileName,
  }) => ProfileDetailsNotifierProvider._(
    argument: (id, url: url, profileName: profileName),
    from: this,
  );

  @override
  String toString() => r'profileDetailsProvider';
}

abstract class _$ProfileDetailsNotifier
    extends $AsyncNotifier<ProfileDetailsState> {
  late final _$args = ref.$arg as (String, {String? url, String? profileName});
  String get id => _$args.$1;
  String? get url => _$args.url;
  String? get profileName => _$args.profileName;

  FutureOr<ProfileDetailsState> build(
    String id, {
    String? url,
    String? profileName,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ProfileDetailsState>, ProfileDetailsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileDetailsState>, ProfileDetailsState>,
              AsyncValue<ProfileDetailsState>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(_$args.$1, url: _$args.url, profileName: _$args.profileName),
    );
  }
}
