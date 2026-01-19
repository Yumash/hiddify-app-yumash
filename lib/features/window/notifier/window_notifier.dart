import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

part 'window_notifier.g.dart';

// Fixed window size - no resizing allowed
const fixedWindowSize = Size(900, 700);

@Riverpod(keepAlive: true)
class WindowNotifier extends _$WindowNotifier with AppLogger {
  @override
  Future<void> build() async {
    await windowManager.ensureInitialized();

    // Set fixed size and disable resizing
    await windowManager.setSize(fixedWindowSize);
    await windowManager.setMinimumSize(fixedWindowSize);
    await windowManager.setMaximumSize(fixedWindowSize);
    await windowManager.setResizable(false);

    // Set window title with full version (e.g., "Hiddify Yumash Edition 2.5.7-yumash-1.0.0")
    final appInfo = await ref.read(appInfoProvider.future);
    await windowManager.setTitle('${Constants.appName} ${appInfo.presentVersion}');
  }

  Future<void> open({bool focus = true}) async {
    await windowManager.show();
    if (focus) await windowManager.focus();
  }

  Future<void> close() async {
    await windowManager.hide();
  }

  Future<void> quit() async {
    await ref.read(connectionProvider.notifier).abortConnection().timeout(const Duration(seconds: 2)).catchError(
      (e) {
        loggy.warning("error aborting connection on quit", e);
      },
    );
    await trayManager.destroy();
    await windowManager.destroy();
  }
}
