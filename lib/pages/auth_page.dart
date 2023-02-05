import 'package:coffee_ui/bloc/profile/profile_bloc.dart';
import 'package:coffee_ui/components/loading_coffee.dart';
import 'package:coffee_ui/pages/mobile/custom_scaffold.dart';
import 'package:coffee_ui/pages/mobile/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile/profile_state.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profile) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //user is logged in

              // print(snapshot.connectionState);
              if (!profile.authenticated! && profile.fetchState == 'fetching') {
                return const LoadingCoffee();
              } else if (snapshot.hasData) {
                return const CustomScaffold();
              } else {
                //user is logged out
                return const WelcomeScreen();
              }
            });
      },
    );
  }
}
