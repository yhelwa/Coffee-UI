import 'package:equatable/equatable.dart';

class CoffeeModel extends Equatable {
  String coffeeImagePath;
  String coffeeName;
  double coffeePrice;

  CoffeeModel(
    this.coffeeImagePath,
    this.coffeeName,
    this.coffeePrice,
  );

  @override
  List<Object?> get props => [coffeeImagePath, coffeeName, coffeePrice];
}
