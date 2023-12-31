import 'package:flutter/material.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/interstitial_ad_manager.dart';
import '../services/share.dart';
import 'package:provider/provider.dart';
import '../models/base_model_provider.dart';

class CongigCheckPage extends StatefulWidget {
  const CongigCheckPage({super.key});

  @override
  _CongigCheckPageState createState() => _CongigCheckPageState();
}

class _CongigCheckPageState extends State<CongigCheckPage> {
  final InterstitialAdManager interstitialAdManager = InterstitialAdManager(); //広告で使う
  final GlobalKey _globalKey = GlobalKey(); //シェアで使う

  @override
  void initState() {
    super.initState();
    interstitialAdManager.interstitialAd();//広告で使う
  }

  @override
  Widget build(BuildContext context) {
    // 現在のテーマからTextThemeとColorSchemeを取得
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TextThemeのデモ
            Text('Text Theme', style: textTheme.headline5),
            Text('Display Large', style: textTheme.displayLarge),
            Text('Display Medium', style: textTheme.displayMedium),
            Text('Display Small', style: textTheme.displaySmall),
            Text('Headline Large', style: textTheme.headlineLarge),
            Text('Headline Medium', style: textTheme.headlineMedium),
            Text('Headline Small', style: textTheme.headlineSmall),
            Text('Title Large', style: textTheme.titleLarge),
            Text('Title Medium', style: textTheme.titleMedium),
            Text('Title Small', style: textTheme.titleSmall),
            Text('Body Large', style: textTheme.bodyLarge),
            Text('Body Medium', style: textTheme.bodyMedium),
            Text('Body Small', style: textTheme.bodySmall),
            Text('Label Large', style: textTheme.labelLarge),
            Text('Label Medium', style: textTheme.labelMedium),
            Text('Label Small', style: textTheme.labelSmall),

            // ColorSchemeのデモ
            const SizedBox(height: 20),
            Text('Color Scheme', style: textTheme.headline5),
            _buildColorItem('Primary', colorScheme.primary, colorScheme.onPrimary),
            _buildColorItem('Secondary', colorScheme.secondary, colorScheme.onSecondary),
            _buildColorItem('Error', colorScheme.error, colorScheme.onError),
            _buildColorItem('Background', colorScheme.background, colorScheme.onBackground),
            _buildColorItem('Surface', colorScheme.surface, colorScheme.onSurface),

            // 広告のデモ
            const SizedBox(height: 20),
            BannerAdWidget(),
            ElevatedButton(
              child: const Text('Interstitial Ad'),
              onPressed: () {
                interstitialAdManager.showInterstitialAd();
              },
            ),


            // シェアのデモ
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('テストテキスト'),
              onPressed: () {
                shareWithText("textToShare");
              },
            ),
            RepaintBoundary( //共有したいWidgetをRepaintBoundaryで囲む
              key: _globalKey,
              child: Container(
                color: colorScheme.background, //背景無いと透明になる
                child: Text("共有したいWidget")),
              ),
              ElevatedButton(
                child: const Text('画像付きテストテキスト'),
                onPressed: () {
                  shareWithImage(_globalKey, "text with image");
                },
              ),

              //providerのデモ
              const SizedBox(height: 20),
              Text(Provider.of<BaseModelProvider>(context, listen: false).model.id),//.でメンバ変数にアクセス
            

          ],
        ),
      ),
    );
  }

 Widget _buildColorItem(String label, Color color, Color onColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: color,
              child: Text(
                label,
                style: TextStyle(color: onColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}