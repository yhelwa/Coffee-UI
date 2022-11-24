import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/coffee_model.dart';
import 'package:flutter_application_test/pages/coffee_page.dart';
import 'package:flutter_application_test/pages/coffee_tile.dart';
import 'package:flutter_application_test/pages/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool> coffeeType = {
    'Cappaccino': true,
    'Espresso': false,
    'Latte': false,
    'Flat White': false
  };
  List<CoffeeModel> coffeeTiles = [
    CoffeeModel(
      'assets/images/coffee.png',
      'Cappucino',
      4.99,
    ),
    CoffeeModel(
      'assets/images/lattee.png',
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
      resizeToAvoidBottomInset: false,
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          canvasColor: const Color.fromRGBO(14, 17, 21, 1),
        ),
        child: BottomNavigationBar(
          // backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange.shade700,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          ],
          onTap: navigationTapped,
          currentIndex: _selectedIndex,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.orange.shade700),
                fillColor: Color.fromRGBO(19, 25, 34, 1),
                filled: true,
                hintText: "Find your coffee...",
                hintStyle: TextStyle(color: Colors.grey.shade800),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
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
            Expanded(
              flex: 12,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTiles.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: InkWell(
                        onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoffeePage(
                                    coffeeModel: coffeeTiles[index])))),
                        child: CoffeeTile(
                          coffeeModel: coffeeTiles[index],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
