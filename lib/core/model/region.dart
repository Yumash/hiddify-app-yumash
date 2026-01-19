import 'package:hiddify/core/localization/translations.dart';

enum Region {
  ru,
  other;

  String present(TranslationsEn t) => switch (this) {
        ru => t.settings.general.regions.ru,
        other => t.settings.general.regions.other,
      };
}
