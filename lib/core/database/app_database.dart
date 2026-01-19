import 'package:drift/drift.dart';
// ignore: depend_on_referenced_packages
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter/foundation.dart';
import 'package:hiddify/core/database/connection/database_connection.dart';
import 'package:hiddify/core/database/converters/duration_converter.dart';
import 'package:hiddify/core/database/tables/database_tables.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ProfileEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase({required QueryExecutor connection}) : super(connection);

  AppDatabase.connect() : super(openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      beforeOpen: (details) async {
        if (kDebugMode) {
          await validateDatabaseSchema();
        }
      },
    );
  }
}
