// ignore_for_file: prefer_const_constructors

import 'package:coffee_ui/bloc/coffee/coffee_bloc.dart';
import 'package:coffee_ui/widgets/coffee_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

List<CoffeeModel> coffeeList = [];

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: Icon(
                Icons.person,
              ))
        ],
      ),
      // bottomNavigationBar: BottomMenu(),
      body: SafeArea(
        child: BlocBuilder<CoffeeBloc, CoffeeState>(
          builder: (context, state) {
            if (state is CoffeeInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CoffeeLoaded) {
              if (state.coffees.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 150,
                        color: Colors.orange.shade700,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'You\'re cart is empty',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 45, color: Colors.white),
                      )
                    ],
                  ),
                );
              } else {
                double coffeeTotal =
                    state.coffees.fold(0, (p, c) => p + c.coffeePrice);
                Map<CoffeeModel, int> coffeeMap = {};
                state.coffees.forEach((x) => coffeeMap[x] =
                    !coffeeMap.containsKey(x) ? (1) : (coffeeMap[x]! + 1));
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                            itemCount: coffeeMap.length,
                            itemBuilder: (context, index) {
                              CoffeeModel coffeeKey =
                                  coffeeMap.keys.elementAt(index);
                              return CoffeeCartItem(
                                coffeeModel: coffeeKey,
                                coffeeCount: coffeeMap[coffeeKey]!,
                              );
                            }),
                      ),
                      const SizedBox(height: 30),
                      Flexible(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(35, 35, 47, 1),
                                  ),
                                ),
                                Positioned(
                                  left: -20,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(14, 17, 21, 1),
                                        shape: BoxShape.circle),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Positioned(
                                  right: -20,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(14, 17, 21, 1),
                                        shape: BoxShape.circle),
                                    width: 30,
                                    height: 30,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Delivery Charges'),
                                Text('\$ 4.99'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Taxes'),
                                Text('\$ 42.99'),
                              ],
                            ),
                            Text(
                              '--------------------------------',
                              style: TextStyle(
                                  fontSize: 24, color: Colors.grey.shade700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 45, color: Colors.white),
                                ),
                                Text(
                                  coffeeTotal.toStringAsFixed(2),
                                  // '\$ 42.99',
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 45, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade700,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Pay Now",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
