import 'package:flutter/material.dart';
import 'package:todo/src/routes/build_route.dart';
import 'package:todo/src/screens/home_screen.dart';

class BuildHomeRoute implements BuildRoute {
  static final path = '/';
  @override
  MaterialPageRoute buildRouteFor(String route) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return HomeScreen();
    });
  }

  @override
  bool canBuildRouteFor(String route) {
    return route == path;
  }
}
