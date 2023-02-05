// ignore_for_file: prefer_const_constructors

import 'package:coffee_ui/pages/home_page.dart';
import 'package:coffee_ui/widgets/coffee_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/mobile/checkout_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ui/ui_bloc.dart';
import '../favorites_page.dart';
import '../notifications_page.dart';

class CustomScaffold extends StatefulWidget {
  // int selectedIndex = 2;

  const CustomScaffold({
    Key? key,
    //  required this.selectedIndex
  }) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final List<Widget> _screens = [
    const HomePage(),
    const CheckoutPage(),
    const FavoritesPage(),
    const NotificationsPage()
  ];

  void navigationTapped(int page) {
    UIBloc uiBloc = BlocProvider.of<UIBloc>(context);
    uiBloc.add(ChangeIndex(uiIndex: page));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UIBloc, UIState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            children: _screens,
            index: state.uiIndex,
          ),
          drawer: CoffeeDrawer(),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: SizedBox(
              height: 70,
              child: Theme(
                data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    canvasColor: const Color.fromRGBO(13, 14, 18, 1),
                    hoverColor: Colors.transparent),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orange.shade700,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications), label: ''),
                  ],
                  onTap: navigationTapped,
                  currentIndex: state.uiIndex!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
