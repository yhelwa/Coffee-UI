import 'package:coffee_ui/widgets/intro_screens.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/checkout_page.dart';
import 'package:coffee_ui/pages/intro_page.dart';
import 'package:coffee_ui/pages/login_screen.dart';
import 'package:coffee_ui/splashScreen.dart';
import 'package:coffee_ui/widgets/coffee_preferences.dart';
import 'pages/custom_scaffold.dart';
import 'pages/home_page.dart';

void main() async {
  // await CoffeePrefs.init();
  runApp(const MyCoffeeApp());
}

class MyCoffeeApp extends StatelessWidget {
  const MyCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(14, 17, 21, 1),
        brightness: Brightness.dark,
      ),
      // initialRoute: '/login',
      home: const IntroPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}
