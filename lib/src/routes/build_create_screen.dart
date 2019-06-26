import 'package:flutter/material.dart';
import 'package:todo/src/screens/create_screen.dart';

import 'build_route.dart';

class BuildCreateRoute extends BuildRoute {
  @override
  MaterialPageRoute buildRouteFor(String route) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return CreateScreen();
    });
  }

  @override
  bool canBuildRouteFor(String route) {
    return route == '/create';
  }
}
