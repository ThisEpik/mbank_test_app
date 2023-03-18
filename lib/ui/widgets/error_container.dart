import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/custom_colors.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Icon(
          Icons.error,
          color: CustomColors.red,
          size: 50,
        ),
      ),
    );
  }
}
