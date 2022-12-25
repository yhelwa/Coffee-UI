import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTapped,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback onTapped;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTapped,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      fillColor: Colors.orange.shade700,
      splashColor: Colors.grey,
      textStyle: const TextStyle(color: Colors.white),
      child: Text(
        buttonText,
        style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 2),
      ),
    );
  }
}
