import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(33, 38, 48, 1), Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.grey[800],
      ),
    );
  }
}
