import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/ioc_container.dart';
import 'package:todo/src/routes/router.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal)
        ),

        title: 'todo',
        onGenerateRoute: Router().route,
      ),
      builder: (BuildContext context) {
        var controller = IocContainer.resolve<TodoController>();
        controller.loadTodos();
        return controller;
      },
    );
  }
}
