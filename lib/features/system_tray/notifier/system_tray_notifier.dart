import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/proxy/active/active_proxy_notifier.dart';
import 'package:hiddify/features/window/notifier/window_notifier.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tray_manager/tray_manager.dart';

part 'system_tray_notifier.g.dart';

@Riverpod(keepAlive: true)
class SystemTrayNotifier extends _$SystemTrayNotifier with AppLogger {
  @override
  Future<void> build() async {
    final activeProxy = ref.watch(activeProxyProvider);
    final delay = activeProxy.value?.urlTestDelay ?? 0;
    final newConnectionStatus = delay > 0 && delay < 65000;
    ConnectionStatus connection;
    try {
      connection = await ref.watch(connectionProvider.future);
    } catch (e) {
      loggy.warning("error getting connection status", e);
      connection = const ConnectionStatus.disconnected();
    }

    final t = ref.watch(translationsProvider);

    var tooltip = Constants.appName;
    // Yumash Edition: serviceMode removed, always VPN
    if (connection == const Disconnected()) {
      setIcon(connection);
    } else if (newConnectionStatus) {
      setIcon(const Connected());
      tooltip = "$tooltip - ${connection.present(t)}";
      if (newConnectionStatus) {
        tooltip = "$tooltip : ${delay}ms";
      } else {
        tooltip = "$tooltip : -";
      }
    } else {
      setIcon(const Disconnecting());
      tooltip = "$tooltip - ${connection.present(t)}";
    }
    await trayManager.setToolTip(tooltip);

    final menu = Menu(
      items: [
        MenuItem(
          label: t.tray.dashboard,
          onClick: (_) async {
            await ref.read(windowProvider.notifier).open();
          },
        ),
        MenuItem.separator(),
        MenuItem.checkbox(
          label: switch (connection) {
            Disconnected() => t.tray.status.connect,
            Connecting() => t.tray.status.connecting,
            Connected() => t.tray.status.disconnect,
            Disconnecting() => t.tray.status.disconnecting,
          },
          // checked: connection.isConnected,
          checked: false,
          disabled: connection.isSwitching,
          onClick: (_) async {
            await ref.read(connectionProvider.notifier).toggleConnection();
          },
        ),
        MenuItem.separator(),
        // Yumash Edition: VPN mode only, no need for service mode selection
        MenuItem(
          label: t.config.serviceModes.tun,
          icon: Assets.images.trayIconIco,
          disabled: true,
        ),
        MenuItem.separator(),
        MenuItem(
          label: t.tray.quit,
          onClick: (_) {
            ref.read(windowProvider.notifier).quit();
          },
        ),
      ],
    );

    await trayManager.setContextMenu(menu);
  }

  static void setIcon(ConnectionStatus status) {
    trayManager.setIcon(_trayIconPath(status)).asStream();
  }

  static String _trayIconPath(ConnectionStatus status) {
    // Windows only - use .ico files
    // Connected: orange, Connecting/Disconnecting: orange, Disconnected: gray
    switch (status) {
      case Connected():
        return Assets.images.trayIconConnectedIco; // Orange
      case Connecting():
        return Assets.images.trayIconConnectedIco; // Orange (connecting)
      case Disconnecting():
        return Assets.images.trayIconConnectedIco; // Orange (disconnecting)
      case Disconnected():
        return Assets.images.trayIconDisconnectedIco; // Gray
    }
  }
}
