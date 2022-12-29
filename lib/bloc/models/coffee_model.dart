import 'package:equatable/equatable.dart';

class CoffeeModel extends Equatable {
  final String coffeeImagePath;
  final String coffeeName;
  final double coffeePrice;

  const CoffeeModel(
    this.coffeeImagePath,
    this.coffeeName,
    this.coffeePrice,
  );

  @override
  List<Object?> get props => [coffeeImagePath, coffeeName, coffeePrice];
}
