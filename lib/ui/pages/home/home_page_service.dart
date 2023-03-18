import 'package:flutter/cupertino.dart';
import 'package:mbank_test_app/data/models/manufacturer_model.dart';
import 'package:mbank_test_app/data/providers/get_manufacturers_request.dart';
import 'package:mbank_test_app/data/utils/utils.dart';
import 'package:mbank_test_app/ui/pages/detail/detail_page.dart';

class HomePageService {
  final ScrollController scrollController = ScrollController();

  final GetManufacturersRequest _getManufacturersRequest =
      GetManufacturersRequest();

  // ignore: prefer_final_fields
  List<ManufacturerModel> _manufacturers = [];
  List<ManufacturerModel> get manufacturers => _manufacturers;

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getManufacturers(BuildContext context) async {
    _isLoading = true;
    _manufacturers
        .addAll(await _getManufacturersRequest.get(context, _pageNumber));
    _pageNumber++;
    _isLoading = false;
  }

  static void goToDetailPage(
      BuildContext context, ManufacturerModel manufacturer) {
    Utils.push(context, DetailPage(manufacturer: manufacturer));
  }

  void startScrollControllerListener(
      BuildContext context, void Function() updateState) {
    scrollController.addListener(() async {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        await getManufacturers(context);
        updateState();
      }
    });
  }
}
