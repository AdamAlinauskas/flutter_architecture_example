import 'package:flutter/material.dart';
import 'package:todo/src/ioc_container.dart';
import 'package:todo/src/tasks/startup.dart';
import 'app.dart';

main() {
  Startup.execute().then((controller)=> runApp(App(controller)));
}
