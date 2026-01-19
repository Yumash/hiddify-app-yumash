import 'package:hiddify/core/localization/locale_preferences.dart';
import 'package:hiddify/gen/translations.g.dart';
import 'package:riverpod/riverpod.dart';

export 'package:hiddify/gen/translations.g.dart';

// Manual provider - riverpod_generator doesn't work with slang types
// See: https://github.com/rrousselGit/riverpod/issues/4323
final translationsProvider = Provider<Translations>((ref) {
  return ref.watch(localePreferencesProvider).buildSync();
});
