// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coffee_ui/bloc/models/coffee_model.dart';
import '../widgets/constants.dart';

class SpecialForYou extends StatelessWidget {
  final CoffeeModel coffee;

  const SpecialForYou({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 120,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(35, 35, 47, 1),
          Color.fromRGBO(14, 19, 26, 1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              coffee.coffeeImagePath,
              fit: BoxFit.cover,
              width: 170,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '5 Coffee Beans you must try!',
                style: CoffeeTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
