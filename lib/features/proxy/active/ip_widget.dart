import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/utils/ip_utils.dart';
import 'package:hiddify/gen/fonts.gen.dart';
import 'package:hiddify/utils/riverpod_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_widget.g.dart';

/// AutoDispose notifier for IP visibility toggle (Riverpod 3.x)
@riverpod
class ShowIp extends _$ShowIp {
  @override
  bool build() {
    ref.disposeDelay(const Duration(seconds: 20));
    return false;
  }

  void toggle() => state = !state;
}

class IPText extends HookConsumerWidget {
  const IPText({
    required this.ip,
    required this.onLongPress,
    this.constrained = false,
    super.key,
  });

  final String ip;
  final VoidCallback onLongPress;
  final bool constrained;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final isVisible = ref.watch(showIpProvider);
    final textTheme = Theme.of(context).textTheme;
    final ipStyle =
        (constrained ? textTheme.labelMedium : textTheme.labelLarge)?.copyWith(
      fontFamily: FontFamily.emoji,
    );

    return Semantics(
      label: t.proxies.ipInfoSemantics.address,
      child: InkWell(
        onTap: () {
          ref.read(showIpProvider.notifier).toggle();
        },
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: AnimatedCrossFade(
            firstChild: Text(
              ip,
              style: ipStyle,
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
            ),
            secondChild: Padding(
              padding: constrained
                  ? EdgeInsets.zero
                  : const EdgeInsetsDirectional.only(end: 48),
              child: Text(
                obscureIp(ip),
                semanticsLabel: t.general.hidden,
                style: ipStyle,
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            crossFadeState: isVisible
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}

class UnknownIPText extends HookConsumerWidget {
  const UnknownIPText({
    required this.text,
    required this.onTap,
    this.constrained = false,
    super.key,
  });

  final String text;
  final VoidCallback onTap;
  final bool constrained;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);
    final textTheme = Theme.of(context).textTheme;
    final style = constrained ? textTheme.bodySmall : textTheme.labelMedium;

    return Semantics(
      label: t.proxies.ipInfoSemantics.address,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            text,
            style: style,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class IPCountryFlag extends HookConsumerWidget {
  const IPCountryFlag({required this.countryCode, this.size = 24, super.key});

  final String countryCode;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider);

    return Semantics(
      label: t.proxies.ipInfoSemantics.country,
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(2),
        child: Center(
          child: CircleFlag(
              countryCode.toLowerCase() == "ir" ? "ir-shir" : countryCode,),
        ),
      ),
    );
  }
}
