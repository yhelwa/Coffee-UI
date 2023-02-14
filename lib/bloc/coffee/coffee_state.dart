import 'package:coffee_ui/models/coffee_model.dart';
import 'package:coffee_ui/models/menu_model.dart';

class CoffeeState {
  List<CoffeeModel>? coffeeCartList;
  List<MenuModel>? coffeeItems;
  List<MenuModel>? filteredCoffeeItems;
  List<CoffeeModel>? coffeeList;
  int? indexType;

  CoffeeState(
      {this.coffeeCartList,
      this.coffeeList,
      this.coffeeItems,
      this.filteredCoffeeItems,
      this.indexType});

  CoffeeState copyWith(CoffeeState coffeeState) {
    return CoffeeState(
      coffeeCartList: coffeeState.coffeeCartList ?? coffeeCartList,
      coffeeList: coffeeState.coffeeList ?? coffeeList,
      coffeeItems: coffeeState.coffeeItems ?? coffeeItems,
      filteredCoffeeItems:
          coffeeState.filteredCoffeeItems ?? filteredCoffeeItems,
      indexType: coffeeState.indexType ?? indexType,
    );
  }
}
