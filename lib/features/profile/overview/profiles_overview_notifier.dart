import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/profile/data/profile_data_providers.dart';
import 'package:hiddify/features/profile/data/profile_repository.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';
import 'package:hiddify/features/profile/model/profile_sort_enum.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profiles_overview_notifier.g.dart';

@riverpod
class ProfilesOverviewSortNotifier extends _$ProfilesOverviewSortNotifier with AppLogger {
  @override
  ({ProfilesSort by, SortMode mode}) build() {
    return (by: ProfilesSort.lastUpdate, mode: SortMode.descending);
  }

  void changeSort(ProfilesSort sortBy) => state = (by: sortBy, mode: state.mode);

  void toggleMode() => state = (by: state.by, mode: state.mode == SortMode.ascending ? SortMode.descending : SortMode.ascending);
}

@riverpod
class ProfilesOverviewNotifier extends _$ProfilesOverviewNotifier with AppLogger {
  @override
  Stream<List<ProfileEntity>> build() {
    final sort = ref.watch(profilesOverviewSortProvider);
    return _profilesRepo.watchAll(sort: sort.by, sortMode: sort.mode).map((event) => event.getOrElse((l) => throw l));
  }

  ProfileRepository get _profilesRepo => ref.read(profileRepositoryProvider).requireValue;

  Future<Unit> selectActiveProfile(String id) {
    loggy.debug('changing active profile to: [$id]');
    return _profilesRepo.setAsActive(id).getOrElse((err) {
      loggy.warning('failed to set [$id] as active profile', err);
      throw err;
    }).run();
  }

  Future<void> deleteProfile(ProfileEntity profile) async {
    loggy.debug('deleting profile: ${profile.name}');

    // If profile is active, disconnect first to prevent connection issues
    if (profile.active) {
      loggy.info('profile is active, disconnecting before deletion');
      await ref.read(connectionProvider.notifier).abortConnection();
    }

    await _profilesRepo.deleteById(profile.id).match(
      (err) {
        loggy.warning('failed to delete profile', err);
        throw err;
      },
      (_) {
        loggy.info(
          'successfully deleted profile, was active? [${profile.active}]',
        );
        return unit;
      },
    ).run();
  }

  Future<void> exportConfigToClipboard(ProfileEntity profile) async {
    await _profilesRepo.generateConfig(profile.id).match(
      (err) {
        loggy.warning('error generating config', err);
        throw err;
      },
      (configJson) async {
        await Clipboard.setData(ClipboardData(text: configJson));
      },
    ).run();
  }
}
