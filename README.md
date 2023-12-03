# Abstaract

```
flutter create --org dev.tubasasakunn fltemplate
```
とXcodeでrunner/xplaceのRunner->Signing&Capabilities->teamで設定

# How to use
プロジェクト名の変更
```
python3 rename.py <プロジェクト名>
```
アイコンの設定
（assets/icon_*）を置き換えてから
```
flutter pub run flutter_launcher_icons:main
```
androidのreleaseKeyの設定
~/.zshrcにpassの書き込み
```
export storePassword=<storePassword作ったときのパスワード>
```
バージョンを上げる
```
./update_build_info.sh
```

広告貼る場合は以下を変更
- android/app/src/main/AndroidManifest.xml
- ios/Runner/Info.plist
- lib/configs/ad.dart