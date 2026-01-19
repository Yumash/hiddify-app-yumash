import 'package:flutter/material.dart';
import 'package:hiddify/core/theme/yumash_colors.dart';

class ConnectionButtonTheme extends ThemeExtension<ConnectionButtonTheme> {
  const ConnectionButtonTheme({
    this.idleColor,
    this.connectedColor,
  });

  final Color? idleColor;
  final Color? connectedColor;

  // Light theme: TARDIS Blue when idle, Green when connected
  static const ConnectionButtonTheme light = ConnectionButtonTheme(
    idleColor: YumashColors.secondary,
    connectedColor: YumashColors.success,
  );

  // Dark theme: Lighter variants for visibility
  static const ConnectionButtonTheme dark = ConnectionButtonTheme(
    idleColor: YumashColors.secondaryDarkTheme,
    connectedColor: YumashColors.success,
  );

  @override
  ThemeExtension<ConnectionButtonTheme> copyWith({
    Color? idleColor,
    Color? connectedColor,
  }) =>
      ConnectionButtonTheme(
        idleColor: idleColor ?? this.idleColor,
        connectedColor: connectedColor ?? this.connectedColor,
      );

  @override
  ThemeExtension<ConnectionButtonTheme> lerp(
    covariant ThemeExtension<ConnectionButtonTheme>? other,
    double t,
  ) {
    if (other is! ConnectionButtonTheme) {
      return this;
    }
    return ConnectionButtonTheme(
      idleColor: Color.lerp(idleColor, other.idleColor, t),
      connectedColor: Color.lerp(connectedColor, other.connectedColor, t),
    );
  }
}
