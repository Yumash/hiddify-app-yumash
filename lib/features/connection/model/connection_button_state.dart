import 'package:flutter/material.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/theme/theme_extensions.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Connection button visual state
enum ConnectionButtonState {
  /// Not connected, ready to connect
  disconnected,

  /// Connection in progress (no delay yet)
  connecting,

  /// Connected and working
  connected,

  /// Connected but config changed, needs reconnect
  reconnectRequired,

  /// Error state
  error;

  /// Determine button state from connection status and other factors
  factory ConnectionButtonState.from({
    required AsyncValue<ConnectionStatus> connectionStatus,
    required bool requiresReconnect,
    required int delay,
  }) {
    return switch (connectionStatus) {
      AsyncError() => ConnectionButtonState.error,
      AsyncData(value: Connected()) when requiresReconnect => ConnectionButtonState.reconnectRequired,
      // Show as connected even when delay is 0 (xray outbounds may not have ping yet)
      // Only show connecting if delay is explicitly invalid (>= 65000 means timeout/error)
      AsyncData(value: Connected()) when delay >= 65000 => ConnectionButtonState.connecting,
      AsyncData(value: Connected()) => ConnectionButtonState.connected,
      AsyncData(value: Disconnected()) => ConnectionButtonState.disconnected,
      AsyncData(value: Connecting()) => ConnectionButtonState.connecting,
      AsyncData(value: Disconnecting()) => ConnectionButtonState.connecting,
      _ => ConnectionButtonState.disconnected,
    };
  }

  /// Get button color for this state
  Color color(ConnectionButtonTheme theme) => switch (this) {
        ConnectionButtonState.disconnected => theme.idleColor!,
        ConnectionButtonState.connecting => const Color.fromARGB(255, 185, 176, 103),
        ConnectionButtonState.connected => theme.connectedColor!,
        ConnectionButtonState.reconnectRequired => Colors.teal,
        ConnectionButtonState.error => Colors.red,
      };

  /// Get button label for this state
  String label(TranslationsEn t, ConnectionStatus? status) => switch (this) {
        ConnectionButtonState.reconnectRequired => t.connection.reconnect,
        ConnectionButtonState.connecting => t.connection.connecting,
        ConnectionButtonState.error => t.connection.tapToConnect,
        _ => status?.present(t) ?? '',
      };

  /// Whether the button should be enabled
  bool get isEnabled => switch (this) {
        ConnectionButtonState.connected ||
        ConnectionButtonState.disconnected ||
        ConnectionButtonState.reconnectRequired ||
        ConnectionButtonState.error =>
          true,
        ConnectionButtonState.connecting => false,
      };
}
