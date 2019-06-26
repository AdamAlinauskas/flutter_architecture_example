import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'app.dart';

//final todoRepository = TodoRepository();
GetIt getit = new GetIt();
main() {

  getit.registerSingleton<TodoRepository>(TodoRepository());
  var repo = getit.get<TodoRepository>();

  getit.registerFactory<TodoController>(
          () => TodoController(getit.get<TodoRepository>()));

  getit.get<TodoController>();


  runApp(App());
}
