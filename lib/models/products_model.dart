import 'coffee_model.dart';

class ProductsModel {
  final String name;
  final List<CoffeeModel> coffees;

  ProductsModel({
    required this.name,
    required this.coffees,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
      name: map['name'] as String,
      coffees: map['products'] != null && (map['products'] as List).isNotEmpty
          ? List.from(map['products'])
              .map((element) => CoffeeModel.fromJson(element))
              .toList()
          : [],
    );
  }
}
