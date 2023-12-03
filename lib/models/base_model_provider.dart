//クラス横断してデータを共有できるクラス
import 'package:flutter/material.dart';
import 'base_model.dart';

class BaseModelProvider with ChangeNotifier {
  BaseModel model = BaseModel(id: 'test');

  // メソッドで値を変更する
  void changeId(String id) {
    model = BaseModel(id: id);
    notifyListeners(); // 変更を確定する
  }
}