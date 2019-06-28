import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/routes/router.dart';


class App extends StatelessWidget {
  TodoController _controller;
  App(this._controller);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal)
        ),
        title: 'todo',
        onGenerateRoute: Router().route,
      ),
      builder: (BuildContext context) {
        _controller.loadTodos();
        return _controller;
      },
    );
  }
}
