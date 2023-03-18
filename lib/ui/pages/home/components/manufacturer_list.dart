import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/models/manufacturer_model.dart';
import 'package:mbank_test_app/ui/pages/home/home_page_service.dart';

class ManufacturerList extends StatelessWidget {
  final ScrollController scrollController;
  final List<ManufacturerModel> manufacturers;

  const ManufacturerList({
    super.key,
    required this.manufacturers,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        for (ManufacturerModel manufacturer in manufacturers)
          ListTile(
            onTap: () => HomePageService.goToDetailPage(context, manufacturer),
            leading: Text('${manufacturer.mfrID}'),
            title: Text(manufacturer.country),
            subtitle: Text(manufacturer.mfrName),
          )
      ],
    );
  }
}
