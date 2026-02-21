// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// AutoDispose notifier for IP visibility toggle (Riverpod 3.x)

@ProviderFor(ShowIp)
final showIpProvider = ShowIpProvider._();

/// AutoDispose notifier for IP visibility toggle (Riverpod 3.x)
final class ShowIpProvider extends $NotifierProvider<ShowIp, bool> {
  /// AutoDispose notifier for IP visibility toggle (Riverpod 3.x)
  ShowIpProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showIpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showIpHash();

  @$internal
  @override
  ShowIp create() => ShowIp();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showIpHash() => r'deaaa99622bd1fd3ea7045f2f9c3a884891bbb16';

/// AutoDispose notifier for IP visibility toggle (Riverpod 3.x)

abstract class _$ShowIp extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
