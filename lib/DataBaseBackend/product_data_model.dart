class ProductDataModel {
  int? id;
  String? name;
  String? category;
  String? oldPrice;
  String? price;

  ProductDataModel(
    this.id,
    this.name,
    this.category,
    this.oldPrice,
    this.price,
  );

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }
}
