import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/checkout_page.dart';
import 'package:flutter_application_test/pages/login_screen.dart';
import 'package:flutter_application_test/splashScreen.dart';
import 'package:flutter_application_test/widgets/coffee_preferences.dart';
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
        // iconTheme: IconThemeData(size: 20)
        // primarySwatch: Colors.orange,
      ),
      initialRoute: '/login',
      // home: const CustomScaffold(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}
