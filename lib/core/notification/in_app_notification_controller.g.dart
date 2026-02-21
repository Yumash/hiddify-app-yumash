// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_notification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inAppNotificationController)
final inAppNotificationControllerProvider =
    InAppNotificationControllerProvider._();

final class InAppNotificationControllerProvider
    extends
        $FunctionalProvider<
          InAppNotificationController,
          InAppNotificationController,
          InAppNotificationController
        >
    with $Provider<InAppNotificationController> {
  InAppNotificationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inAppNotificationControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inAppNotificationControllerHash();

  @$internal
  @override
  $ProviderElement<InAppNotificationController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InAppNotificationController create(Ref ref) {
    return inAppNotificationController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InAppNotificationController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InAppNotificationController>(value),
    );
  }
}

String _$inAppNotificationControllerHash() =>
    r'11b10215e66600853b8571e0146dea03e76be34f';
