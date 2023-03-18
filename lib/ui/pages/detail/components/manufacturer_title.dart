import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/custom_colors.dart';

class ManufacturerTitle extends StatelessWidget {
  final String manufacturerName;

  const ManufacturerTitle({super.key, required this.manufacturerName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Center(
        child: Text(
          manufacturerName,
          style: const TextStyle(
            color: CustomColors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
