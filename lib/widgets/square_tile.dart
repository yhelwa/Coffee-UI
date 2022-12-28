import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareTile extends StatelessWidget {
  final String iconPath;
  final void Function() onTap;

  const SquareTile({Key? key, required this.iconPath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(
          iconPath,
          color: iconPath == 'assets/icons/apple.svg' ? Colors.white : null,
        ),
      ),
    );
  }
}
