import 'package:flutter/material.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/data_access/todo_repository.dart';
import 'package:todo/src/entities/todo.dart';
import 'package:todo/src/screens/home_screen.dart';
import 'build_route.dart';
import 'package:provider/provider.dart';

class BuildHomeRoute implements BuildRoute {
  @override
  MaterialPageRoute buildRouteFor(String route) {

    return MaterialPageRoute(builder: (BuildContext context) {
      return HomeScreen();
    });
  }

  @override
  bool canBuildRouteFor(String route) {
    return route == '/';
  }
}
