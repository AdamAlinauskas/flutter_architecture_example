import 'package:flutter/material.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/entities/todo.dart';
import 'package:todo/src/routes/navigate.dart';

class TodoController extends ChangeNotifier {
  TodoRepository _repo;
  List<Todo> items = [];

  TodoController(this._repo);

  void loadTodos() async {
    items = await _repo.fetchAll();//TODO: needs to be extracted to a query
    notifyListeners();
  }

  void create(String text, BuildContext context) { //TODO: needs to be extracted to a command
    print(text);
    _repo.save(Todo(text:text));
    loadTodos();
    Navigate.goBack(context);
  }
}
