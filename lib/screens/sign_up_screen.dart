import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widgets/coffee_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

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
              Column(
                children: [
                  CoffeeTextField(
                    controller: passwordController,
                    hintText: 'Username',
                  ),
                  CoffeeTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  CoffeeTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isObscure: true,
                  ),
                  CoffeeTextField(
                    controller: passwordController,
                    hintText: 'Confirm Password',
                    isObscure: true,
                  ),
                ],
              ),
              InkWell(
                onTap: (() {
                  setState(() {
                    _loading = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacementNamed(context, '/home');
                    _loading = false;
                  });
                }),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign Up",
                    style:
                        GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 2),
                  ),
                ),
              ),
            ],
          );
  }
}
