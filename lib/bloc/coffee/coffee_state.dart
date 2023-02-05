import 'package:coffee_ui/models/coffee_model.dart';

class CoffeeState {
  List<CoffeeModel>? coffeeCartList;
  List<CoffeeModel>? coffeeItems;
  List<CoffeeModel>? filteredCoffeeItems;

  CoffeeState(
      {this.coffeeCartList, this.coffeeItems, this.filteredCoffeeItems});

  CoffeeState copyWith(CoffeeState coffeeState) {
    return CoffeeState(
      coffeeCartList: coffeeState.coffeeCartList ?? coffeeCartList,
      coffeeItems: coffeeState.coffeeItems ?? coffeeItems,
      filteredCoffeeItems:
          coffeeState.filteredCoffeeItems ?? filteredCoffeeItems,
    );
  }
}
