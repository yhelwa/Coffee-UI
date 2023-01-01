import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  const CoffeeTextField({
    Key? key,
    this.isObscure = false,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        obscuringCharacter: '*',
        style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: isObscure ? 5 : null),
        cursorColor: const Color(0xffB7B7BD),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            // borderSide: const BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 1, color: Colors.grey),
          ),
          filled: true,
          hintStyle: GoogleFonts.montserrat(
            color: const Color(0xFFD1D1D1),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          hintText: hintText,
          fillColor: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
