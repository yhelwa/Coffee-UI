import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  final String jsonPath;
  final String title;
  const IntroScreen({Key? key, required this.jsonPath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset(
          jsonPath,
          width: 400,
          height: 400,
        ),
        Text(
          title,
          style: GoogleFonts.bebasNeue(fontSize: 45, color: Colors.white),
        ),
        const SizedBox()
      ],
    );
  }
}
