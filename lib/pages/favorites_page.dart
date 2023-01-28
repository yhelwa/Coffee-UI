import 'package:coffee_ui/widgets/constants.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Icon(
          Icons.favorite,
          size: 150,
          color: Colors.grey.shade700,
        )),
        const SizedBox(height: 30),
        Text('No favorites', style: CoffeeTextStyle.copyWith(fontSize: 45))
      ],
    );
  }
}
