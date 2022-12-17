// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/bottom_menu.dart';
import 'package:flutter_application_test/pages/coffee_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/coffee_cart_item.dart';

class CheckoutPage extends StatefulWidget {
  static ValueNotifier<List<CoffeeModel>> coffeeList = ValueNotifier([]);

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: coffeeList.isEmpty
              ? Center(
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
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: ListView.builder(
                          itemCount: CheckoutPage.coffeeList.value.length,
                          itemBuilder: (context, index) {
                            return CoffeeCartItem(
                              coffeeModel: CheckoutPage.coffeeList.value[index],
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
                                '\$ 42.99',
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
        ),
      ),
    );
  }
}
