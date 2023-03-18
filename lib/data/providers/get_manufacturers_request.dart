import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mbank_test_app/data/global_constants/backend_data.dart';
import 'package:mbank_test_app/data/models/manufacturer_model.dart';
import 'package:mbank_test_app/data/utils/custom_dio.dart';

class GetManufacturersRequest {
  Future<List<ManufacturerModel>> get(
      BuildContext context, int pageNumber) async {
    final Response? response = await CustomDio.get(context,
        '${BackendData.host}/getallmanufacturers?format=json&page=$pageNumber',
        (statusCode, errorData) {
      /// handle errors
    });

    if (response == null) return [];

    final List<ManufacturerModel> manufacturers = [];

    for (Map<String, dynamic> manufacturer in response.data['Results']) {
      manufacturers.add(ManufacturerModel.fromMap(manufacturer));
    }

    return manufacturers;
  }
}
