import 'package:flutter/material.dart';
import 'buildRoutes/build_create_route.dart';
import 'buildRoutes/build_home_route.dart';

class Router{
  final routeList = [BuildHomeRoute(), BuildCreateRoute()];

  Route route(RouteSettings settings) {
    print(settings.name);

    return routeList
        .firstWhere((route) => route.canBuildRouteFor(settings.name))
        .buildRouteFor(settings.name);
  }
}