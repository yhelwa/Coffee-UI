import 'package:coffee_ui/models/coffee_model.dart';

class CartItemModel {
  CoffeeModel? coffeeModel;
  int? qty;

  CartItemModel({required this.coffeeModel, required this.qty});
}
