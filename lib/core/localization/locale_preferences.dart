import 'package:hiddify/core/preferences/preferences_provider.dart';
import 'package:hiddify/gen/translations.g.dart';
import 'package:hiddify/utils/custom_loggers.dart';
import 'package:riverpod/riverpod.dart';

// Manual provider - riverpod_generator doesn't work with slang types
// See: https://github.com/rrousselGit/riverpod/issues/4323
final localePreferencesProvider =
    NotifierProvider<LocalePreferences, AppLocale>(LocalePreferences.new);

class LocalePreferences extends Notifier<AppLocale> with AppLogger {
  @override
  AppLocale build() {
    final persisted =
        ref.watch(sharedPreferencesProvider).requireValue.getString("locale");
    if (persisted == null) return AppLocaleUtils.findDeviceLocale();
    try {
      return AppLocale.values.byName(persisted);
    } catch (e) {
      loggy.error("error setting locale: [$persisted]", e);
      return AppLocale.en;
    }
  }

  Future<void> changeLocale(AppLocale value) async {
    state = value;
    await ref
        .read(sharedPreferencesProvider)
        .requireValue
        .setString("locale", value.name);
  }
}
