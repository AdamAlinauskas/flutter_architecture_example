import 'package:flutter/material.dart';

abstract class BuildRoute{
  bool canBuildRouteFor(String route);
  MaterialPageRoute buildRouteFor(String route);
}