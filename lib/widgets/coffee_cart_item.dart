import 'package:flutter/material.dart';
import '../pages/coffee_model.dart';

class CoffeeCartItem extends StatefulWidget {
  final CoffeeModel coffeeModel;

  const CoffeeCartItem({
    Key? key,
    required this.coffeeModel,
  }) : super(key: key);

  @override
  State<CoffeeCartItem> createState() => _CoffeeCartItemState();
}

class _CoffeeCartItemState extends State<CoffeeCartItem> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          child: const Padding(
            padding: EdgeInsets.only(right: 28.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
        ),
        onDismissed: (direction) {
          print(direction.name);
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(35, 35, 47, 1),
              Color.fromRGBO(14, 19, 26, 1),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  widget.coffeeModel.coffeeImagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image
                  const SizedBox(height: 10),
                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffeeModel.coffeeName,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'With Oat Milk',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                        TextSpan(
                            text: widget.coffeeModel.coffeePrice.toString()),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (() =>
                          count == 0 ? null : setState(() => count--)),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.orange.shade700,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.remove,
                          size: 14,
                        ),
                      ),
                    ),
                    // const SizedBox(width: 10),
                    const Spacer(),
                    Text(
                      count.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    // const SizedBox(width: 10),
                    const Spacer(),
                    InkWell(
                      onTap: (() => setState(() => count++)),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.orange.shade700,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
