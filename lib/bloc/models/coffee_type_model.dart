import 'products_model.dart';

class CoffeeTypeModel {
  final String name; //Hot coffees cold coffees
  final List<ProductsModel> products;

  CoffeeTypeModel({
    required this.name,
    required this.products,
  });

  factory CoffeeTypeModel.fromJson(Map<String, dynamic> map) {
    return CoffeeTypeModel(
      name: map['name'] as String,
      products: map['children'] != null && (map['children'] as List).isNotEmpty
          ? List.from(map['children'])
              .map((element) => ProductsModel.fromJson(element))
              .toList()
          : [],
    );
  }
}
