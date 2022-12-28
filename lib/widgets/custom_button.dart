import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTapped;
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.onTapped,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: RawMaterialButton(
        onPressed: onTapped,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 15),
        fillColor: Colors.orange.shade700,
        splashColor: Colors.grey,
        textStyle: const TextStyle(color: Colors.white),
        child: Text(
          buttonText,
          style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 2),
        ),
      ),
    );
  }
}
