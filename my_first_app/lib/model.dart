// data model class
class Fruits {
  String fruitName;
  String shopName;
  double price;

  int id;
  String word;
  int frequency;

  Fruits(this.fruitName,this.shopName,this.price);
  Fruits.map(dynamic obj){
    this.fruitName = obj['fruit_name'];
    this.shopName = obj['shop_name'];
    this.price = obj['price'];
  }

  String get _fruitName => fruitName;
  String get _shopName => shopName;
  double get _price => price;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['fruit_name'] = _fruitName;
    map['shop_name'] = _shopName;
    map['price'] = _price;
    return map;
  }

  Fruits.fromMap(Map<String, dynamic> map){
    this.fruitName = map['fruit_name'];
    this.shopName = map['shop_name'];
    this.price = map['price'];
  }


}

