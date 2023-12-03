import 'package:flutter/material.dart';
import 'page/check_page.dart';
import 'configs/thema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: createThemeData(context, false),
      darkTheme: createThemeData(context, true),
      home: const CongigCheckPage(),
    );
  }
}
