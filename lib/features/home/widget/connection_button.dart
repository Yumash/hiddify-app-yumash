import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/failures.dart';
import 'package:hiddify/core/theme/theme_extensions.dart';
import 'package:hiddify/core/widget/animated_text.dart';
import 'package:hiddify/features/config_option/notifier/config_option_notifier.dart';
import 'package:hiddify/features/connection/model/connection_button_state.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/profile/notifier/active_profile_notifier.dart';
import 'package:hiddify/features/proxy/active/active_proxy_notifier.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:hiddify/utils/alerts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectionButton extends HookConsumerWidget {
  const ConnectionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final connectionStatus = ref.watch(connectionProvider);
    final delay = ref.watch(activeProxyProvider).value?.urlTestDelay ?? 0;
    final requiresReconnect = ref.watch(configOptionProvider).value ?? false;

    // Compute button state
    final buttonState = ConnectionButtonState.from(
      connectionStatus: connectionStatus,
      requiresReconnect: requiresReconnect,
      delay: delay,
    );

    // Listen for connection errors
    ref.listen(
      connectionProvider,
      (_, next) {
        if (next case AsyncError(:final error)) {
          CustomAlertDialog.fromErr(t.presentError(error)).show(context);
        }
        if (next case AsyncData(value: Disconnected(:final connectionFailure?))) {
          CustomAlertDialog.fromErr(t.presentError(connectionFailure)).show(context);
        }
      },
    );

    final buttonTheme = Theme.of(context).extension<ConnectionButtonTheme>()!;

    return _ConnectionButtonView(
      state: buttonState,
      label: buttonState.label(t, connectionStatus.value),
      color: buttonState.color(buttonTheme),
      onTap: () => _handleTap(context, ref, buttonState, requiresReconnect),
    );
  }

  Future<void> _handleTap(
    BuildContext context,
    WidgetRef ref,
    ConnectionButtonState state,
    bool requiresReconnect,
  ) async {
    if (!state.isEnabled) return;

    final notifier = ref.read(connectionProvider.notifier);

    switch (state) {
      case ConnectionButtonState.disconnected:
      case ConnectionButtonState.error:
        await notifier.toggleConnection();

      case ConnectionButtonState.reconnectRequired:
        final profile = await ref.read(activeProfileProvider.future);
        await notifier.reconnect(profile);

      case ConnectionButtonState.connected:
        await notifier.toggleConnection();

      case ConnectionButtonState.connecting:
        // Button disabled during connecting
        break;
    }
  }

}

class _ConnectionButtonView extends StatelessWidget {
  const _ConnectionButtonView({
    required this.state,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final ConnectionButtonState state;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = state.isEnabled;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Semantics(
          button: true,
          enabled: enabled,
          label: label,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  color: color.withValues(alpha: 0.5),
                ),
              ],
            ),
            width: 148,
            height: 148,
            child: Material(
              key: const ValueKey("home_connection_button"),
              shape: const CircleBorder(),
              color: Colors.white,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(36),
                  child: TweenAnimationBuilder(
                    tween: ColorTween(end: color),
                    duration: const Duration(milliseconds: 250),
                    builder: (context, value, child) {
                      return Assets.images.logo.svg(
                        colorFilter: ColorFilter.mode(
                          value!,
                          BlendMode.srcIn,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ).animate(target: enabled ? 0 : 1).blurXY(end: 1),
          ).animate(target: enabled ? 0 : 1).scaleXY(end: .88, curve: Curves.easeIn),
        ),
        const Gap(16),
        ExcludeSemantics(
          child: AnimatedText(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
