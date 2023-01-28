// ignore_for_file: unnecessary_this

import 'package:coffee_ui/bloc/models/coffee_model.dart';

class CoffeeState {
  List<CoffeeModel>? coffeeCartList;
  List<CoffeeModel>? coffeeItems;

  CoffeeState({this.coffeeCartList, this.coffeeItems});

  CoffeeState copyWith(CoffeeState coffeeState) {
    return CoffeeState(
      coffeeCartList: coffeeState.coffeeCartList ?? this.coffeeCartList,
      coffeeItems: coffeeState.coffeeItems ?? this.coffeeItems,
    );
  }
}
