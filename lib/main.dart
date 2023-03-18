import 'package:flutter/material.dart';
import 'package:mbank_test_app/ui/pages/home/home_page.dart';

void main() {
  runApp(_MBankTestApp());
}

class _MBankTestApp extends StatelessWidget {
  _MBankTestApp();

  final ThemeData _themeData = ThemeData(
    primarySwatch: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBankTestApp',
      theme: _themeData,
      home: const HomePage(),
    );
  }
}
