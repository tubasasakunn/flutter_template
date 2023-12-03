import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;




Future<void> shareWithImage(GlobalKey globalKey,String textToShare) async {
  final boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 3);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);  // <-- 修正
  
  final buffer = byteData!.buffer.asUint8List();

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/image.png');
  await file.writeAsBytes(buffer);
  await Share.shareFiles([file.path], text: textToShare);
}

Future<void> shareWithText(String textToShare) async {
  await Share.share(textToShare);
}