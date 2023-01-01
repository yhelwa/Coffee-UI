import 'package:flutter/material.dart';

class CoffeeTypeWeb extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  const CoffeeTypeWeb({
    Key? key,
    required this.coffeeType,
    required this.isSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: !isSelected ? Colors.transparent : Colors.orange.shade700,
          border: Border.all(color: Colors.orange.shade700)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Text(
        coffeeType,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: !isSelected ? Colors.orange.shade700 : Colors.white),
      ),
    );
  }
}
