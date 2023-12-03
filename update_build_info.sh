#!/bin/sh
# update_build_info.sh

# Gitコミット数を取得
GIT_COMMIT_COUNT=$(git rev-list --count HEAD)

# Gitコミットハッシュを取得
GIT_COMMIT_HASH=$(git rev-parse --short HEAD)

# iOSのInfo.plistのパス
INFO_PLIST="./ios/Runner/Info.plist"

# Androidのbuild.gradleのパス
BUILD_GRADLE="./android/app/build.gradle"

# iOSのCFBundleVersionとCFBundleShortVersionStringを更新
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $GIT_COMMIT_COUNT" $INFO_PLIST
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString 1.0.0-$GIT_COMMIT_HASH" $INFO_PLIST

# AndroidのversionCodeとversionNameを更新
sed -i '' "s/versionCode [0-9]*/versionCode $GIT_COMMIT_COUNT/" $BUILD_GRADLE
sed -i '' "s/versionName \".*\"/versionName \"1.0.0-$GIT_COMMIT_HASH\"/" $BUILD_GRADLE
