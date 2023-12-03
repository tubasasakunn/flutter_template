import 'package:flutter/material.dart';


ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light, // 全体の明るさ。`Brightness.light` または `Brightness.dark`
  primary: Colors.green, // プライマリカラー（アプリバーなどに使用）
  onPrimary: Colors.white, // プライマリカラーの上に配置される要素（例：テキスト）
  secondary: Colors.amber, // セカンダリカラー（フローティングアクションボタンなどに使用）
  onSecondary: Colors.black, // セカンダリカラーの上に配置される要素
  error: Colors.red, // エラーカラー（エラーメッセージなどに使用）
  onError: Colors.white, // エラーカラーの上に配置される要素
  background: Colors.grey, // アプリの背景色
  onBackground: Colors.black, // 背景色の上に配置される要素
  surface: Colors.purple, // カードやダイアログなどの表面の色
  onSurface: Colors.white, // 表面の色の上に配置される要素
);

ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: colorScheme.onPrimary,
  onPrimary: colorScheme.primary,
  secondary: colorScheme.onSecondary,
  onSecondary: colorScheme.secondary,
  error: colorScheme.onError,
  onError: colorScheme.error,
  background: colorScheme.onBackground,
  onBackground: colorScheme.background,
  surface: colorScheme.onSurface,
  onSurface: colorScheme.surface,
);

ThemeData createThemeData(BuildContext context, bool isDark) {
  final ColorScheme selectedColorScheme = isDark ? darkColorScheme : colorScheme;

  // 画面の横幅に基づいて基本フォントサイズを計算
  double screenWidth = MediaQuery.of(context).size.width;
  double baseFontSize = screenWidth / 30; 

  // テキストテーマを生成
const String customFontFamily = "Roboto"; // ここに使用するフォントファミリー名を指定

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: baseFontSize * 3.8, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  displayMedium: TextStyle(fontSize: baseFontSize * 2.4, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  displaySmall: TextStyle(fontSize: baseFontSize * 1.9, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  headlineLarge: TextStyle(fontSize: baseFontSize * 1.36, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  headlineMedium: TextStyle(fontSize: baseFontSize * 1.0, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  headlineSmall: TextStyle(fontSize: baseFontSize * 0.8, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  titleLarge: TextStyle(fontSize: baseFontSize * 0.88, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  titleMedium: TextStyle(fontSize: baseFontSize * 0.64, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  titleSmall: TextStyle(fontSize: baseFontSize * 0.56, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  bodyLarge: TextStyle(fontSize: baseFontSize * 0.64, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  bodyMedium: TextStyle(fontSize: baseFontSize * 0.56, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  bodySmall: TextStyle(fontSize: baseFontSize * 0.48, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  labelLarge: TextStyle(fontSize: baseFontSize * 0.56, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  labelMedium: TextStyle(fontSize: baseFontSize * 0.48, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
  labelSmall: TextStyle(fontSize: baseFontSize * 0.44, fontWeight: FontWeight.normal, color: selectedColorScheme.onBackground, fontFamily: customFontFamily),
);


  // ThemeDataを生成して返す
  return ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: selectedColorScheme,
    textTheme: textTheme,
    iconTheme: IconThemeData(color: selectedColorScheme.onBackground),
  );
}
