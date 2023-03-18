import 'package:flutter/material.dart';
import 'package:mbank_test_app/ui/pages/home/components/home_page_app_bar.dart';
import 'package:mbank_test_app/ui/pages/home/components/manufacturer_list.dart';
import 'package:mbank_test_app/ui/pages/home/home_page_service.dart';
import 'package:mbank_test_app/ui/widgets/custom_loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageService _service = HomePageService();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _service.getManufacturers(context);
      setState(() {});
    });

    _service.startScrollControllerListener(context, () => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: _service.isLoading
          ? const CustomLoadingIndicator()
          : ManufacturerList(
              manufacturers: _service.manufacturers,
              scrollController: _service.scrollController,
            ),
    );
  }
}
