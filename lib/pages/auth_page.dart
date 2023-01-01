import 'package:coffee_ui/pages/mobile/custom_scaffold.dart';
import 'package:coffee_ui/pages/mobile/welcome_screen.dart';
import 'package:coffee_ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in

          if (snapshot.hasData) {
            return CustomScaffold(selectedIndex: 0);
          } else {
            //user is logged out
            return const WelcomeScreen();
          }
        });
  }
}
