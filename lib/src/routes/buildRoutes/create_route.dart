import 'package:flutter/material.dart';
import 'package:todo/src/routes/build_route.dart';
import 'package:todo/src/screens/create_screen.dart';

class BuildCreateRoute extends BuildRoute {
  static final path = '/create';

  @override
  MaterialPageRoute buildRouteFor(String route) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return CreateScreen();
    });
  }

  @override
  bool canBuildRouteFor(String route) {
    return route == path;
  }


}
