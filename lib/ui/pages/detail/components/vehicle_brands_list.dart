import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/custom_colors.dart';
import 'package:mbank_test_app/data/models/vehicle_brand_model.dart';

class VehicleBrandsList extends StatelessWidget {
  final List<VehicleBrandModel> vehicles;

  const VehicleBrandsList({super.key, required this.vehicles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (VehicleBrandModel vehicle in vehicles)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text(vehicle.makeName),
          )
      ],
    );
  }
}
