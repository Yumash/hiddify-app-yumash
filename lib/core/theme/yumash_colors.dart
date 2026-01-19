import 'package:flutter/material.dart';

/// Yumash Edition color palette
/// Primary: Orange (#FF6B00)
/// Secondary: TARDIS Blue (#003B6F)
class YumashColors {
  YumashColors._();

  // Primary - Orange
  static const Color primary = Color(0xFFFF6B00);
  static const Color primaryLight = Color(0xFFFF9E40);
  static const Color primaryDark = Color(0xFFCC5500);

  // Secondary - TARDIS Blue (Pantone 2955C)
  static const Color secondary = Color(0xFF003B6F);
  static const Color secondaryLight = Color(0xFF1A5A8F);
  static const Color secondaryDark = Color(0xFF002244);

  // Semantic colors
  static const Color success = Color(0xFF44A334);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFFA000);

  // Dark theme variants (lighter for visibility)
  static const Color primaryDarkTheme = Color(0xFFFF8C3A);
  static const Color secondaryDarkTheme = Color(0xFF4A8CC7);
}
