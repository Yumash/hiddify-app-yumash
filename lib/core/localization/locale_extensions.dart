import 'package:hiddify/gen/fonts.gen.dart';
import 'package:hiddify/gen/translations.g.dart';

extension AppLocaleX on AppLocale {
  // Windows only - use Emoji font for better emoji support
  String get preferredFontFamily => FontFamily.emoji;

  /// Native locale name (displayed in language selector)
  String get localeName => switch (languageTag) {
        "en" => "English",
        "ru" => "Русский", // Russian in Russian
        _ => languageTag,
      };
}
