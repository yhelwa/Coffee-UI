import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  const CoffeeType({
    Key? key,
    required this.coffeeType,
    required this.isSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      child: Text(
        coffeeType,
        style: TextStyle(
            fontSize: 18, color: isSelected ? Colors.orange : Colors.white),
      ),
    );
  }
}
