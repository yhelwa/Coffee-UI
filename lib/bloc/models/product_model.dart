class ProductModel {
  final String coffeeName;
  // final String coffeeDescription;
  final String coffeeImagePath;
  final double coffeePrice;

  ProductModel({
    required this.coffeeName,
    // required this.coffeeDescription,
    required this.coffeeImagePath,
    required this.coffeePrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': coffeeName,
      // 'description': coffeeDescription,
      'image': coffeeImagePath,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
        coffeeName: map['name'] as String,
        // coffeeDescription: map['description'] as String,
        coffeeImagePath: map['assets']['fullSize']['uri'] ??
            map['assets']['masterImage']['uri'] as String,
        coffeePrice: 3.99);
  }
}
