import 'package:coffee_ui/components/special.dart';
import 'package:coffee_ui/pages/web/checkout_page_web.dart';
import 'package:coffee_ui/providers/api.dart';
import 'package:coffee_ui/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:coffee_ui/bloc/models/coffee_model.dart';
import 'package:coffee_ui/pages/mobile/coffee_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/search.dart';
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
  List<CoffeeModel>? coffeeTiles;
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
  late Stream<List<CoffeeModel>> _coffeeStream;

  @override
  void initState() {
    _coffeeStream = API.getCoffees();

    super.initState();
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
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                onPressed: signUserOut,
                icon: const Icon(
                  Icons.person,
                ),
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
              StreamBuilder<List<CoffeeModel>>(
                  stream: _coffeeStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print('object');
                      coffeeTiles = snapshot.data;
                      return Column(
                        children: [
                          SizedBox(
                            height: 355,
                            child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 20),
                                scrollDirection: Axis.horizontal,
                                itemCount: coffeeTiles!.length - 2,
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: InkWell(
                                      onTap: (() => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CoffeePage(
                                                  coffeeModel:
                                                      coffeeTiles![index],
                                                  index: index),
                                            ),
                                          )),
                                      child: CoffeeTile(
                                        coffeeModel: coffeeTiles![index],
                                        index: index,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Special for you',
                            style: CoffeeTextStyle.copyWith(fontSize: 32),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 600,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return SpecialForYou(
                                      coffee: coffeeTiles![index]);
                                }),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
