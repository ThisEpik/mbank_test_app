import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/custom_colors.dart';
import 'package:mbank_test_app/data/global_constants/localization_text.dart';

abstract class CustomSnackBar {
  static Future<void> show(
    BuildContext context,
    String title, {
    Color color = CustomColors.green,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      backgroundColor: color,
    ));
  }

  static Future<void> showSomethingWentWrong(BuildContext context) async {
    await show(context, LocalizationText.somethingWentWrong,
        color: CustomColors.red);
  }
}
