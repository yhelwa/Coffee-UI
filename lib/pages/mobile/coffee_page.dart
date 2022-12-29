import 'dart:ui';
import 'package:coffee_ui/bloc/coffee/coffee_bloc.dart';
import 'package:coffee_ui/pages/mobile/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/coffee_size.dart';
import '../../widgets/custom_icon.dart';
import '../../bloc/models/coffee_model.dart';

class CoffeePage extends StatelessWidget {
  final CoffeeModel coffeeModel;
  final int index;
  const CoffeePage({Key? key, required this.coffeeModel, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'imageHero$index',
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(coffeeModel.coffeeImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CustomIcon(icon: Icons.arrow_back_ios_new_outlined),
                            CustomIcon(icon: Icons.favorite),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: BackdropFilter(
                          // blendMode: BlendMode.dstOver,
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coffeeModel.coffeeName,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'With Oat Milk',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.orange.shade700),
                                        const SizedBox(width: 10),
                                        const Text('4.5'),
                                        const SizedBox(width: 5),
                                        Text(
                                          '(6,986)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(33, 38, 48, 1),
                                                Colors.black
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.coffee,
                                                color: Colors.orange.shade700,
                                              ),
                                              Text(
                                                'Coffee',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(33, 38, 48, 1),
                                                Colors.black
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.water_drop,
                                                color: Colors.orange.shade700,
                                              ),
                                              Text(
                                                'Milk',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(33, 38, 48, 1),
                                            Colors.black
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Text(
                                        'Medium Roasted',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          'A cappuccino is a coffee-based drink made primarily espresso and milk ',
                      style: TextStyle(
                        color: Colors.grey.shade200,
                      )),
                  TextSpan(
                      text: '... Read More',
                      style: TextStyle(
                        color: Colors.orange.shade700,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Size',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const CoffeeSize(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Price',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 16),
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
                          TextSpan(text: coffeeModel.coffeePrice.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
                BlocBuilder<CoffeeBloc, CoffeeState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: (() {
                        if (state is CoffeeLoaded) {
                          print(state.coffees.length);
                        }
                        // CheckoutPage.coffeeList.value.add(coffeeModel);
                        // print(CheckoutPage.coffeeList.value);
                        print('Inside add coffee');
                        context
                            .read<CoffeeBloc>()
                            .add(AddCoffee(coffee: coffeeModel));
                        // CoffeePrefs.setCoffeeCartItems(coffeeList);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomScaffold(
                              selectedIndex: 1,
                            ),
                          ),
                        );
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "ADD TO CART",
                          style: GoogleFonts.bebasNeue(
                              fontSize: 24, letterSpacing: 3),
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
