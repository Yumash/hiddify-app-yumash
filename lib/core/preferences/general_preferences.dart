import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/model/environment.dart';
import 'package:hiddify/core/preferences/actions_at_closing.dart';
import 'package:hiddify/core/preferences/preferences_provider.dart';
import 'package:hiddify/core/utils/preferences_utils.dart';
import 'package:hiddify/utils/platform_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'general_preferences.g.dart';

abstract class Preferences {

  static final silentStart = PreferencesNotifier.create<bool, bool>(
    "silent_start",
    false,
  );

  static final disableMemoryLimit = PreferencesNotifier.create<bool, bool>(
    "disable_memory_limit",
    // disable memory limit on desktop by default
    PlatformUtils.isDesktop,
  );

  static final markNewProfileActive = PreferencesNotifier.create<bool, bool>(
    "mark_new_profile_active",
    true,
  );

  static final dynamicNotification = PreferencesNotifier.create<bool, bool>(
    "dynamic_notification",
    true,
  );

  static final autoCheckIp = PreferencesNotifier.create<bool, bool>(
    "auto_check_ip",
    true,
  );

  static final startedByUser = PreferencesNotifier.create<bool, bool>(
    "started_by_user",
    false,
  );

  static final storeReviewedByUser = PreferencesNotifier.create<bool, bool>(
    "store_reviewed_by_user",
    false,
  );

  static final actionAtClose = PreferencesNotifier.create<ActionsAtClosing, String>(
    "action_at_close",
    ActionsAtClosing.ask,
    mapFrom: ActionsAtClosing.values.byName,
    mapTo: (value) => value.name,
  );
}

@Riverpod(keepAlive: true)
class DebugModeNotifier extends _$DebugModeNotifier {
  late final _pref = PreferencesEntry(
    preferences: ref.watch(sharedPreferencesProvider).requireValue,
    key: "debug_mode",
    defaultValue: ref.read(environmentProvider) == Environment.dev,
  );

  @override
  bool build() => _pref.read();

  Future<void> update(bool value) {
    state = value;
    return _pref.write(value);
  }
}
