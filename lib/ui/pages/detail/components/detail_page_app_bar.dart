import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/localization_text.dart';

class DetailPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const DetailPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(LocalizationText.manufacturersDetailScreen),
    );
  }
}
