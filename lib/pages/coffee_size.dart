import 'package:flutter/material.dart';

class CoffeeSize extends StatefulWidget {
  const CoffeeSize({Key? key}) : super(key: key);

  @override
  State<CoffeeSize> createState() => _CoffeeSizeState();
}

Map<String, bool> coffeeSize = {
  'S': true,
  'M': false,
  'L': false,
};

class _CoffeeSizeState extends State<CoffeeSize> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: coffeeSize.length,
        itemBuilder: (context, index) {
          String coffeeKey = coffeeSize.keys.elementAt(index);
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                coffeeSize.updateAll((key, value) => value = false);
                coffeeSize[coffeeKey] = true;
              });
            },
            child: Container(
              width: 110,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: coffeeSize[coffeeKey]!
                        ? Colors.orange.shade700
                        : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: coffeeSize[coffeeKey]!
                      ? const Color.fromRGBO(14, 17, 21, 1)
                      : const Color.fromRGBO(19, 25, 34, 1)),
              child: Center(
                child: Text(
                  coffeeKey,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
