import 'product_model.dart';

class ProductsModel {
  final String name;
  final List<ProductModel> products;

  ProductsModel({
    required this.name,
    required this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
      name: map['name'] as String,
      products: map['products'] != null && (map['products'] as List).isNotEmpty
          ? List.from(map['products'])
              .map((element) => ProductModel.fromJson(element))
              .toList()
          : [],
    );
  }
}
