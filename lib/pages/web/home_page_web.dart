import 'package:coffee_ui/pages/home_page.dart';
import 'package:coffee_ui/pages/web/checkout_page_web.dart';
import 'package:coffee_ui/pages/web/coffee_page_web.dart';
import 'package:coffee_ui/pages/web/widgets/coffee_tile_web.dart';
import 'package:coffee_ui/pages/web/widgets/coffee_type_web.dart';
import 'package:coffee_ui/widgets/coffee_drawer.dart';
import 'package:flutter/material.dart';

import 'package:coffee_ui/models/coffee_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/search.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  Map<String, bool> coffeeType = {
    'Cappuccino': true,
    'Espresso': false,
    'Latte': false,
    'Flat White': false
  };
  // List<CoffeeModel> coffeeTiles = [
  //   const CoffeeModel(
  //     'assets/images/coffee.png',
  //     'Cappuccino',
  //     4.99,
  //   ),
  //   const CoffeeModel(
  //     'assets/images/lattee.jpg',
  //     'Latte',
  //     5.99,
  //   ),
  //   const CoffeeModel(
  //     'assets/images/milk.png',
  //     'Milk',
  //     2.99,
  //   ),
  // ];
  List<CoffeeModel> coffeeTiles = [];
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
          if (HomePage.isDesktop(context)) const CoffeeDrawer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      const Expanded(
                        child: SearchBar(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 55,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: coffeeType.length,
                      itemBuilder: (context, index) {
                        String coffeeKey = coffeeType.keys.elementAt(index);
                        return InkWell(
                          splashFactory: NoSplash.splashFactory,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              coffeeType
                                  .updateAll((key, value) => value = false);
                              coffeeType[coffeeKey] = true;
                            });
                          },
                          child: CoffeeTypeWeb(
                            coffeeType: coffeeKey,
                            isSelected: coffeeType.values.elementAt(index),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 40);
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    // height: 355,
                    // flex: 3,
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30,
                          ),
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
                                child: CoffeeTileWeb(
                                  coffeeModel: coffeeTiles[index],
                                  index: index,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
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
