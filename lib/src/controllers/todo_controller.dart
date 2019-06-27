import 'package:flutter/material.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/entities/todo.dart';
import 'package:todo/src/routes/navigate.dart';

import '../ioc_container.dart';

class TodoController extends ChangeNotifier {
  final TodoRepository repo = IocContainer.resolve<TodoRepository>();
  List<Todo> items = [];

  void loadTodos() async {
    await repo.init();
    items = await repo.fetchAll();
    notifyListeners();
  }

  void create(String text, BuildContext context) {
    print(text);
    repo.save(Todo(text:text));
    loadTodos();
    Navigate.goBack(context);
  }
}
