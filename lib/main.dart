import 'package:coffee_ui/pages/home_page.dart';
import 'package:coffee_ui/pages/mobile/custom_scaffold.dart';
import 'package:coffee_ui/pages/mobile/home_page_mobile.dart';
import 'package:coffee_ui/pages/mobile/intro_page.dart';
import 'package:coffee_ui/pages/mobile/welcome_screen.dart';
import 'package:coffee_ui/pages/web/home_page_web.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/mobile/checkout_page.dart';
import 'package:coffee_ui/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/coffee/coffee_bloc.dart';

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
          '/home': (context) => const HomePageMobile(),
          '/welcome': (context) => const WelcomeScreen(),
          '/checkout': (context) => const CheckoutPage(),
          '/custom': (context) => CustomScaffold(selectedIndex: 0),
        },
      ),
    );
  }
}
