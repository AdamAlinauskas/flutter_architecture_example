import 'package:flutter/material.dart';
import 'package:todo/src/screens/home_screen.dart';
import 'build_route.dart';

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
