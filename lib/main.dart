import 'package:flutter/material.dart';
import 'page/check_page.dart';
import 'configs/thema.dart';
import 'models/base_model_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseModelProvider()),
        // 他のプロバイダーがあればここに追加
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseModelProvider baseModelProvider = Provider.of<BaseModelProvider>(context, listen: false); //finalで宣言しないとエラーになる
    baseModelProvider.changeId('changed'); //メソッドで値を変更
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: createThemeData(context, false),
      darkTheme: createThemeData(context, true),
      home: const CongigCheckPage(),
    );
  }
}
