part of 'coffee_bloc.dart';

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();

  @override
  List<Object> get props => [];
}

class LoadCoffee extends CoffeeEvent {}

class AddCoffee extends CoffeeEvent {
  final CoffeeModel coffee;

  const AddCoffee({required this.coffee});

  @override
  List<Object> get props => [coffee];
}

class RemoveCoffee extends CoffeeEvent {
  final CoffeeModel coffee;

  const RemoveCoffee({required this.coffee});

  @override
  List<Object> get props => [coffee];
}
