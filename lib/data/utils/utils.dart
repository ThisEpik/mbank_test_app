import 'package:flutter/material.dart';

abstract class Utils {
  static Future<void> push(BuildContext context, Widget page) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: ((context) => page)));
  }

  static dynamic pop(BuildContext context, {dynamic result}) {
    return Navigator.pop(context, result);
  }

  static bool canPop(BuildContext context, {dynamic result}) {
    return Navigator.canPop(context);
  }

  static Future<bool> maybePop(BuildContext context, {dynamic result}) async {
    return await Navigator.maybePop(context);
  }

  static Future<void> pushReplacement(BuildContext context, Widget page) async {
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => page)));
  }
}
