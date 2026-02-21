// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_overview_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogsOverviewNotifier)
final logsOverviewProvider = LogsOverviewNotifierProvider._();

final class LogsOverviewNotifierProvider
    extends $NotifierProvider<LogsOverviewNotifier, LogsOverviewState> {
  LogsOverviewNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsOverviewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsOverviewNotifierHash();

  @$internal
  @override
  LogsOverviewNotifier create() => LogsOverviewNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogsOverviewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogsOverviewState>(value),
    );
  }
}

String _$logsOverviewNotifierHash() =>
    r'5d9a1094fec5b144b125082fc79feb0432307e65';

abstract class _$LogsOverviewNotifier extends $Notifier<LogsOverviewState> {
  LogsOverviewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LogsOverviewState, LogsOverviewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LogsOverviewState, LogsOverviewState>,
              LogsOverviewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
