import '../models/coffee_model.dart';

class CoffeeEvent {
  const CoffeeEvent();
}

class LoadCoffee extends CoffeeEvent {}

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

class Login extends CoffeeEvent {
  final bool isLogin;

  const Login({required this.isLogin});
}
