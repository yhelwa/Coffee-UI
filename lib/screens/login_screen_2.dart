import 'package:coffee_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widgets/coffee_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  TextEditingController emailController =
      TextEditingController(text: 'yhelwa12@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');

  bool _loading = false;
  late AnimationController _coffeeController;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              controller: _coffeeController,
              height: 100,
              width: 100,
              onLoaded: (composition) {
                _coffeeController
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.coffee_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Welcome back',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 45, color: Colors.white),
                  ),
                ],
              ),
              // const SizedBox(height: 80),
              Column(
                children: [
                  CoffeeTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  CoffeeTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isObscure: true,
                  ),
                ],
              ),
              // const SizedBox(height: 30),
              CustomButton(buttonText: "Sign in", onTapped: signIn),
            ],
          );
  }

  void signIn() {
    setState(() {
      _loading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/custom');
      _loading = false;
    });
  }
}
