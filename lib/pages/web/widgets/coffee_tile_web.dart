import 'package:coffee_ui/widgets/coffee_size.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/coffee/coffee_bloc.dart';
import '../../../bloc/coffee/coffee_event.dart';
import '../../../bloc/coffee/coffee_state.dart';

class CoffeeTileWeb extends StatelessWidget {
  final CoffeeModel coffeeModel;
  final int index;
  const CoffeeTileWeb({
    Key? key,
    required this.coffeeModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(35, 35, 47, 1),
            Color.fromRGBO(14, 19, 26, 1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Hero(
                  tag: 'imageHero$index',
                  child: Image.asset(
                    coffeeModel.coffeeImagePath,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          coffeeModel.coffeeName,
                          style: const TextStyle(fontSize: 26),
                        ),
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
                                  text: coffeeModel.coffeePrice.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'With Oat Milk',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The combination of coffee, milk, and palm sugar makes this drink have a delicious taste.',
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade600),
                      maxLines: 3,
                    ),
                    const CoffeeSize(),
                    BlocBuilder<CoffeeBloc, CoffeeState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: (() {
                            // CheckoutPage.coffeeList.value.add(coffeeModel);
                            // print(CheckoutPage.coffeeList.value);
                            print('Inside add coffee');
                            context
                                .read<CoffeeBloc>()
                                .add(AddCoffee(coffee: coffeeModel));
                            // CoffeePrefs.setCoffeeCartItems(coffeeList);
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade700,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "ADD TO CART",
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 18, letterSpacing: 2),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
