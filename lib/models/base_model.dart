class BaseModel {
  
  //メンバ変数
  final String id;
  
  //コンストラクタ
  BaseModel({required this.id});

  //メソッド
  String makeId() {
    return id;
  }
}