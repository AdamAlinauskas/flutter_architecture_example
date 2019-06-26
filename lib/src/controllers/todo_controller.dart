import 'package:flutter/material.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/entities/todo.dart';
import 'package:todo/src/routes/navigate.dart';

class TodoController extends ChangeNotifier {
  TodoRepository repo;
  List<Todo> items = [];

  TodoController(this.repo);

  void loadTodos() async {
    //should call a command
    await repo.init();
    items = await repo.fetchAll();
//    theItems.clear();
//    theItems.forEach((x)=>items.add(x)); //no need to loop can replace.

    notifyListeners();
  }

  void create(String text, BuildContext context) {
    print(text);
    repo.save(Todo(text:text));
    loadTodos();
    Navigate.goBack(context);
  }
}
