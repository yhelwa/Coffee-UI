import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);
  static int selectedIndex = 0;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    void navigationTapped(int page) {
      print("Page is $page");
      print('_selectedIndex was ${BottomMenu.selectedIndex}');
      if (BottomMenu.selectedIndex != page) {
        print(ModalRoute.of(context)!.settings.name);

        if (page == 0) {
          Navigator.pushNamed(
            context,
            '/home',
          );
        } else if (page == 1) {
          print('entering checkout');
          Navigator.pushNamed(
            context,
            '/checkout',
          );
        }
      }
      setState(() {
        BottomMenu.selectedIndex = page;
        print('changed eselected index');
      });
    }

    return Theme(
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
        currentIndex: BottomMenu.selectedIndex,
      ),
    );
  }
}
