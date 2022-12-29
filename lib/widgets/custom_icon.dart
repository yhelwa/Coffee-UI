import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final IconData icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  // ignore: unused_field
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => setState(() => _isSelected = !_isSelected),
      onTap: () => Navigator.pop(context),
      child: Container(
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
          widget.icon,
          color: widget.icon == Icons.favorite && _isSelected
              ? Colors.red.shade900
              : Colors.grey[800],
        ),
      ),
    );
  }
}
