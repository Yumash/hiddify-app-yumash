// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddProfile)
final addProfileProvider = AddProfileProvider._();

final class AddProfileProvider
    extends $NotifierProvider<AddProfile, AsyncValue<Unit?>> {
  AddProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addProfileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addProfileHash();

  @$internal
  @override
  AddProfile create() => AddProfile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Unit?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Unit?>>(value),
    );
  }
}

String _$addProfileHash() => r'61b0b2e0ffb048d2469f40e746727220d7f554bb';

abstract class _$AddProfile extends $Notifier<AsyncValue<Unit?>> {
  AsyncValue<Unit?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Unit?>, AsyncValue<Unit?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Unit?>, AsyncValue<Unit?>>,
              AsyncValue<Unit?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UpdateProfile)
final updateProfileProvider = UpdateProfileFamily._();

final class UpdateProfileProvider
    extends $NotifierProvider<UpdateProfile, AsyncValue<Unit?>> {
  UpdateProfileProvider._({
    required UpdateProfileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'updateProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateProfileHash();

  @override
  String toString() {
    return r'updateProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UpdateProfile create() => UpdateProfile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Unit?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Unit?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateProfileHash() => r'15458a826cb727adbe9f3a3dfa907baac87c3f7f';

final class UpdateProfileFamily extends $Family
    with
        $ClassFamilyOverride<
          UpdateProfile,
          AsyncValue<Unit?>,
          AsyncValue<Unit?>,
          AsyncValue<Unit?>,
          String
        > {
  UpdateProfileFamily._()
    : super(
        retry: null,
        name: r'updateProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateProfileProvider call(String id) =>
      UpdateProfileProvider._(argument: id, from: this);

  @override
  String toString() => r'updateProfileProvider';
}

abstract class _$UpdateProfile extends $Notifier<AsyncValue<Unit?>> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  AsyncValue<Unit?> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Unit?>, AsyncValue<Unit?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Unit?>, AsyncValue<Unit?>>,
              AsyncValue<Unit?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
