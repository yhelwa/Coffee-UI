import '../../models/coffee_model.dart';

class CoffeeEvent {
  const CoffeeEvent();
}

class AddCoffee extends CoffeeEvent {
  final CoffeeModel coffee;
  const AddCoffee({required this.coffee});
}

class RemoveCoffee extends CoffeeEvent {
  final CoffeeModel coffee;
  const RemoveCoffee({required this.coffee});
}

class FetchCoffeeItems extends CoffeeEvent {
  const FetchCoffeeItems();
}

class FilterSearch extends CoffeeEvent {
  final String value;
  const FilterSearch(this.value);
}

class FilterType extends CoffeeEvent {
  final int indexType;
  const FilterType(this.indexType);
}

class Login extends CoffeeEvent {
  final bool isLogin;

  const Login({required this.isLogin});
}
