import 'coffee_type_model.dart';

class MenuModel {
  final String name; //Hot coffees cold coffees
  final List<CoffeeTypeModel> coffeeTypes;

  MenuModel({
    required this.name,
    required this.coffeeTypes,
  });

  factory MenuModel.fromJson(Map<String, dynamic> map) {
    return MenuModel(
      name: map['name'] as String,
      coffeeTypes:
          map['children'] != null && (map['children'] as List).isNotEmpty
              ? List.from(map['children'])
                  .map((element) => CoffeeTypeModel.fromJson(element))
                  .toList()
              : [],
    );
  }
}
