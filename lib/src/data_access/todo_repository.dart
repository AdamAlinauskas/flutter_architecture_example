import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:todo/src/entities/todo.dart';

class TodoRepository {
  Database db;

  Future init() async {
    print('database init');
    //path provider module gets us the location where we can put files.
    //It's not a temp location. Or at least we hope.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "data.db");

    //create it or open it.
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      // only called when the db is created.
      newDb.execute('''
            CREATE TABLE todo
            (
              id INTEGER PRIMARY KEY,
              text TEXT,
              isComplete BIT
            )
            ''');
      newDb.execute("insert into todo(text) values('Clean House')");
      newDb.execute("insert into todo(text) values('Wash Car')");
      newDb.execute("insert into todo(text) values('Build App')");
      newDb.execute("insert into todo(text) values('Build time machine')");
    });
  }

  Future<List<Todo>> fetchAll() async {
    final maps = await db.query('todo', columns: null);
    return maps.map((x) => Todo.fromDb(x)).toList();
  }

//
  Future<int> save(Todo item) {
    return db.insert('todo', item.toMapForDb(),
//    conflictAlgorithm: ConflictAlgorithm.ignore //easy way to solve items already exists
    );
  }

  Future<int> clear() {
    return db.delete('Items');
  }
}


