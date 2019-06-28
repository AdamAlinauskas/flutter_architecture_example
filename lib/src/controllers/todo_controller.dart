import 'package:flutter/material.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/entities/todo.dart';
import 'package:todo/src/routes/navigate.dart';

class TodoController extends ChangeNotifier {
  TodoRepository _repo;
  List<Todo> items = [];
  List<Todo> completedItems = [];

  TodoController(this._repo);

  void loadTodos() async {
    items = await _repo.fetchNotCompleted(); // TODO: needs to be extracted to a query
    completedItems = await _repo.fetchCompleted(); // TODO: needs to be extracted to a query
    notifyListeners();
  }

  void create(String text, BuildContext context) {
    print(text);
    _repo.save(Todo(text:text)); // TODO: needs to be extracted to a command
    loadTodos();
    Navigate.back(context);
  }

  void complete(Todo item) {
    item.isComplete = true;
    _repo.update(item);
    notifyListeners();
    loadTodos();
  }
}
