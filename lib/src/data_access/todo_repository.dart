import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:todo/src/entities/todo.dart';
import 'package:todo/src/orm/dbhelper.dart';

class TodoRepository {
  Database db;

  Future init() async {
     await DBHelper.open().then((database) => db = database);
  }

  Future<List<Todo>> fetchAll() async {
    final maps = await db.query('todo', columns: null);
    return maps.map((x) => Todo.fromDb(x)).toList();
  }

  Future<List<Todo>> fetchNotCompleted() async {
    final maps = await db.query('todo',
        columns: null,
        where: 'isComplete is null or isComplete=?',
        whereArgs: [0]);
    return maps.map((x) => Todo.fromDb(x)).toList();
  }

  Future<List<Todo>> fetchCompleted() async {
    final maps = await db.query('todo',
        columns: null,
        where: 'isComplete=?',
        whereArgs: [1]);
    return maps.map((x) => Todo.fromDb(x)).toList();
  }

  Future<int> save(Todo item) {
    return db.insert('todo', item.toMapForDb());
  }

  Future<int> update(Todo item) {
    return db.update('todo', item.toMapForDb(),
    where: 'id=?',
    whereArgs: [item.id]);
  }

  Future<int> clear() {
    return db.delete('Items');
  }
}


