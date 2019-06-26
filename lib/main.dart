import 'package:flutter/material.dart';
import 'package:todo/src/ioc_container.dart';
import 'app.dart';

main() {
  IocContainer().wireUp();
  runApp(App());
}
