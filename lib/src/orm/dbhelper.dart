import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';

import 'migrations/migrations.dart';


class DBHelper {


  static Future<Database>  open() async {
    print('creating database');
    final initialScript = ['CREATE TABLE todo( id INTEGER PRIMARY KEY,text TEXT,isComplete BIT)'];
    List<String> migrations = List<String>();
    var scripts = Migrator.getMigrations();
    scripts.values.forEach((value) {
      migrations.add(value);
    });

    final config = MigrationConfig(initializationScript: initialScript, migrationScripts: migrations);

    //path provider module gets us the location where we can put files.
    //It's not a temp location. Or at least we hope.
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'data.db');

    return await openDatabaseWithMigration(path, config);
  }
}