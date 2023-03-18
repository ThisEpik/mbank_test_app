import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mbank_test_app/data/global_constants/backend_data.dart';
import 'package:mbank_test_app/data/models/manufacturer_model.dart';
import 'package:mbank_test_app/data/models/vehicle_brand_model.dart';
import 'package:mbank_test_app/data/utils/custom_dio.dart';

class GetManufacturerVehicleBrandsRequest {
  Future<List<VehicleBrandModel>> get(
      BuildContext context, ManufacturerModel manufacturer) async {
    final Response? response = await CustomDio.get(context,
        '${BackendData.host}/GetMakeForManufacturer/${manufacturer.mfrID}?format=json',
        (statusCode, errorData) {
      /// handle errors
    });

    if (response == null) return [];

    final List<VehicleBrandModel> vehicles = [];

    for (Map<String, dynamic> vehicle in response.data['Results']) {
      vehicles.add(VehicleBrandModel.fromMap(vehicle));
    }

    return vehicles;
  }
}
