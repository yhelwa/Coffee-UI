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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            coffeeType,
            style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.orange.shade700 : Colors.white),
          ),
          if (isSelected)
            Icon(
              Icons.circle,
              size: 6,
              color: Colors.orange.shade700,
            )
        ],
      ),
    );
  }
}
