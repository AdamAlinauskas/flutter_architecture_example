import 'package:flutter/cupertino.dart';

class Navigate {
  static to(BuildContext context, String path) {
    Navigator.pushNamed(context, path);
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void backUntil(BuildContext context, String path) {
    Navigator.popAndPushNamed(context, path);
  }
}