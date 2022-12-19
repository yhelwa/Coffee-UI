import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/coffee_model.dart';

class CoffeeTile extends StatelessWidget {
  final CoffeeModel coffeeModel;
  final int index;
  const CoffeeTile({
    Key? key,
    required this.coffeeModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        // padding: const EdgeInsets.all(20),
        width: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(35, 35, 47, 1),
            Color.fromRGBO(14, 19, 26, 1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Hero(
                tag: 'imageHero$index',
                child: Image.asset(
                  coffeeModel.coffeeImagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeeModel.coffeeName,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'With Oat Milk',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: '\$ ',
                          style: TextStyle(
                            color: Colors.orange.shade700,
                          )),
                      TextSpan(text: coffeeModel.coffeePrice.toString()),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange.shade700,
                      borderRadius: BorderRadius.circular(18)),
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
