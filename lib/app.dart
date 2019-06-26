import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/ioc_container.dart';
import 'package:todo/src/routes/router.dart';
import 'package:get_it/get_it.dart';

import 'main.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'todo',
        onGenerateRoute: Router().route,
      ),
      builder: (BuildContext context) {
        var controller = IocContainer().resolve<TodoController>();
        controller.loadTodos();
        return controller;
      },
    );
  }
}
