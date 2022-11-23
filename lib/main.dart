import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/coffee_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyCoffeeApp());
}

class MyCoffeeApp extends StatelessWidget {
  const MyCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(14, 17, 21, 1),
          brightness: Brightness.dark,
          // primarySwatch: Colors.orange,
        ));
  }
}
