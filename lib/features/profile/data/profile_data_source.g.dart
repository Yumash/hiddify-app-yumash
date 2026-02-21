// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_source.dart';

// ignore_for_file: type=lint
mixin _$ProfileDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProfileEntriesTable get profileEntries => attachedDatabase.profileEntries;
  ProfileDaoManager get managers => ProfileDaoManager(this);
}

class ProfileDaoManager {
  final _$ProfileDaoMixin _db;
  ProfileDaoManager(this._db);
  $$ProfileEntriesTableTableManager get profileEntries =>
      $$ProfileEntriesTableTableManager(
        _db.attachedDatabase,
        _db.profileEntries,
      );
}
