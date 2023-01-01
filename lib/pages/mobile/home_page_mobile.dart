import 'package:flutter/material.dart';

import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:coffee_ui/pages/mobile/coffee_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components.dart/search.dart';
import '../../widgets/coffee_tile.dart';
import '../../widgets/coffee_type.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  Map<String, bool> coffeeType = {
    'Cappuccino': true,
    'Espresso': false,
    'Latte': false,
    'Flat White': false
  };
  List<CoffeeModel> coffeeTiles = [
    CoffeeModel(
      'assets/images/coffee.png',
      'Cappuccino',
      4.99,
    ),
    CoffeeModel(
      'assets/images/lattee.jpg',
      'Latte',
      5.99,
    ),
    CoffeeModel(
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
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/welcome');
          },
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
      // bottomNavigationBar: const BottomMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the best \ncoffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 45, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(),
              const SizedBox(height: 20),
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
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
                                  builder: (context) => CoffeePage(
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
      ),
    );
  }
}
