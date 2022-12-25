// ignore_for_file: prefer_const_constructors

import 'package:coffee_ui/widgets/coffee_drawer.dart';
import 'package:coffee_ui/widgets/constants.dart';
import 'package:coffee_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/checkout_page.dart';
import 'package:coffee_ui/pages/home_page.dart';

class CustomScaffold extends StatefulWidget {
  int selectedIndex = 0;

  CustomScaffold({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final List<Widget> _screens = [const HomePage(), const CheckoutPage()];

  void navigationTapped(int page) {
    setState(() {
      widget.selectedIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _screens,
        index: widget.selectedIndex,
      ),
      drawer: CoffeeDrawer(),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          ],
          onTap: navigationTapped,
          currentIndex: widget.selectedIndex,
        ),
      ),
    );
  }
}
