// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppDirectories)
final appDirectoriesProvider = AppDirectoriesProvider._();

final class AppDirectoriesProvider
    extends $AsyncNotifierProvider<AppDirectories, Directories> {
  AppDirectoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDirectoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDirectoriesHash();

  @$internal
  @override
  AppDirectories create() => AppDirectories();
}

String _$appDirectoriesHash() => r'f30913b79ad8043ad9fc5ffeb8d4ac35670250e9';

abstract class _$AppDirectories extends $AsyncNotifier<Directories> {
  FutureOr<Directories> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Directories>, Directories>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Directories>, Directories>,
              AsyncValue<Directories>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
