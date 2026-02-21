// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Watches whether there are any profiles in the database.
/// Used for showing empty state on home screen.

@ProviderFor(hasAnyProfile)
final hasAnyProfileProvider = HasAnyProfileProvider._();

/// Watches whether there are any profiles in the database.
/// Used for showing empty state on home screen.

final class HasAnyProfileProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Watches whether there are any profiles in the database.
  /// Used for showing empty state on home screen.
  HasAnyProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasAnyProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasAnyProfileHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return hasAnyProfile(ref);
  }
}

String _$hasAnyProfileHash() => r'e77cfcf56d7f67fa03fff4b5e238e7e8327b54e7';
