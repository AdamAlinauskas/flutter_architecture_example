import 'package:flutter/cupertino.dart';

class Navigate {
  static toHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, '/create');
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
