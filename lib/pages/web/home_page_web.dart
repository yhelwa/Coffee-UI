import 'package:coffee_ui/pages/web/checkout_page_web.dart';
import 'package:coffee_ui/pages/web/coffee_page_web.dart';
import 'package:coffee_ui/widgets/coffee_drawer.dart';
import 'package:flutter/material.dart';

import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:coffee_ui/pages/mobile/coffee_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/coffee_tile.dart';
import '../../widgets/coffee_type.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  Map<String, bool> coffeeType = {
    'Cappaccino': true,
    'Espresso': false,
    'Latte': false,
    'Flat White': false
  };
  List<CoffeeModel> coffeeTiles = [
    const CoffeeModel(
      'assets/images/coffee.png',
      'Cappucino',
      4.99,
    ),
    const CoffeeModel(
      'assets/images/lattee.jpg',
      'Latte',
      5.99,
    ),
    const CoffeeModel(
      'assets/images/milk.png',
      'Milk',
      2.99,
    ),
  ];

  int _selectedIndex = 0;
  void navigationTapped(int page) {
    print("Page is $page");

    setState(() {
      _selectedIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   toolbarHeight: 50,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/welcome');
      //     },
      //     icon: const Icon(Icons.menu),
      //   ),
      //   actions: const [
      //     Padding(
      //         padding: EdgeInsets.only(right: 25.0),
      //         child: Icon(
      //           Icons.person,
      //         ))
      //   ],
      // ),
      // bottomNavigationBar: const BottomMenu(),
      body: Row(
        children: [
          const CoffeeDrawer(),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Find the best coffee for you',
                      style: GoogleFonts.bebasNeue(
                          fontSize: 32, color: Colors.white),
                    ),
                    // const SizedBox(width: 100),
                    const Spacer(),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          prefixIcon:
                              Icon(Icons.search, color: Colors.orange.shade700),
                          fillColor: const Color.fromRGBO(19, 25, 34, 1),
                          filled: true,
                          hintText: "Find your coffee...",
                          hintStyle: TextStyle(color: Colors.grey.shade800),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: coffeeType.length,
                    itemBuilder: (context, index) {
                      String coffeeKey = coffeeType.keys.elementAt(index);
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            coffeeType.updateAll((key, value) => value = false);
                            coffeeType[coffeeKey] = true;
                          });
                        },
                        child: CoffeeType(
                          coffeeType: coffeeKey,
                          isSelected: coffeeType.values.elementAt(index),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 355,
                  child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: coffeeTiles.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: InkWell(
                            onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoffeePageWeb(
                                        coffeeModel: coffeeTiles[index],
                                        index: index),
                                  ),
                                )),
                            child: CoffeeTile(
                              coffeeModel: coffeeTiles[index],
                              index: index,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  color: const Color.fromRGBO(16, 12, 17, 1).withOpacity(0.4),
                  child: const CheckoutPageWeb()))
        ],
      ),
    );
  }
}
