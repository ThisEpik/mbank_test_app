import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/custom_colors.dart';
import 'package:mbank_test_app/data/models/manufacturer_model.dart';
import 'package:mbank_test_app/data/providers/get_manufacturer_vehicle_brands_request.dart';
import 'package:mbank_test_app/ui/pages/detail/components/detail_page_app_bar.dart';
import 'package:mbank_test_app/ui/pages/detail/components/manufacturer_title.dart';
import 'package:mbank_test_app/ui/pages/detail/components/vehicle_brands_list.dart';
import 'package:mbank_test_app/ui/widgets/custom_loading_indicator.dart';
import 'package:mbank_test_app/ui/widgets/error_container.dart';

class DetailPage extends StatelessWidget {
  final GetManufacturerVehicleBrandsRequest
      _getManufacturerVehicleBrandsRequest =
      GetManufacturerVehicleBrandsRequest();

  final ManufacturerModel manufacturer;

  DetailPage({super.key, required this.manufacturer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.gray,
      appBar: const DetailPageAppBar(),
      body: ListView(
        children: [
          ManufacturerTitle(manufacturerName: manufacturer.country),
          FutureBuilder(
            future:
                _getManufacturerVehicleBrandsRequest.get(context, manufacturer),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const ErrorContainer();

              if (snapshot.hasData) {
                return VehicleBrandsList(vehicles: snapshot.data!);
              } else {
                return const CustomLoadingIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
