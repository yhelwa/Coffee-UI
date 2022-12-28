import 'package:coffee_ui/pages/custom_scaffold.dart';
import 'package:coffee_ui/pages/intro_page.dart';
import 'package:coffee_ui/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/checkout_page.dart';
import 'package:coffee_ui/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/coffee/coffee_bloc.dart';
import 'pages/home_page.dart';

void main() async {
  // await CoffeePrefs.init();WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyCoffeeApp());
}

class MyCoffeeApp extends StatelessWidget {
  const MyCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoffeeBloc()..add(LoadCoffee()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: const SplashScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(14, 17, 21, 1),
          brightness: Brightness.dark,
        ),
        // initialRoute: '/custom',
        home: const IntroPage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/welcome': (context) => const WelcomeScreen(),
          '/checkout': (context) => const CheckoutPage(),
          '/custom': (context) => CustomScaffold(selectedIndex: 0),
        },
      ),
    );
  }
}
