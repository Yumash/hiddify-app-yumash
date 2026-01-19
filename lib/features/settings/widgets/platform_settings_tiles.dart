import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlatformSettingsTiles extends HookConsumerWidget {
  const PlatformSettingsTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // No platform-specific settings for Windows-only build
    return const SizedBox.shrink();
  }
}
