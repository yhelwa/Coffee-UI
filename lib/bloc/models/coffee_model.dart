// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CoffeeModel {
  final String coffeeName;
  final String coffeeDescription;
  final String coffeeImagePath;
  final double coffeePrice;

  CoffeeModel({
    required this.coffeeName,
    required this.coffeeDescription,
    required this.coffeeImagePath,
    required this.coffeePrice,
  });

  @override
  List<Object?> get props =>
      [coffeeName, coffeeDescription, coffeeImagePath, coffeePrice];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': coffeeName,
      'description': coffeeDescription,
      'image': coffeeImagePath,
    };
  }

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    // print('map');
    // print(map);
    return CoffeeModel(
        coffeeName: map['title'] as String,
        coffeeDescription: map['description'] as String,
        coffeeImagePath: map['image'] as String,
        coffeePrice: 3.99);
  }
}
