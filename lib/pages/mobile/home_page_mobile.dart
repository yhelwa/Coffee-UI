import 'package:coffee_ui/bloc/coffee/coffee_bloc.dart';
import 'package:coffee_ui/bloc/coffee/coffee_event.dart';
import 'package:coffee_ui/pages/web/widgets/coffee_types.dart';
import 'package:coffee_ui/widgets/coffee_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/search.dart';
import '../../widgets/coffee_list.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key}) : super(key: key);
  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  // List<String> coffeeType = [
  //   'Cappuccino',
  //   'Espresso',
  //   'Latte',
  //   'Flat White',
  // ];

  @override
  void initState() {
    super.initState();
    getCoffeeItems();
  }

  getCoffeeItems() async {
    CoffeeBloc _coffee = BlocProvider.of<CoffeeBloc>(context);
    _coffee.add(const FetchCoffeeItems());
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CoffeeDrawer(),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                onPressed: signUserOut,
                icon: const Icon(
                  Icons.logout,
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
              const SizedBox(height: 20),
              const SearchBar(),
              const SizedBox(height: 20),
              const CoffeeTypes(),
              const SizedBox(height: 20),
              const CoffeeListSpecial(),
            ],
          ),
        ),
      ),
    );
  }

  void signUserOut() async {
    print("Signing out");
    await FirebaseAuth.instance.signOut();
  }
}
