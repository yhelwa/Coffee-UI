import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingCoffee extends StatefulWidget {
  const LoadingCoffee({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingCoffee> createState() => _LoadingCoffeeState();
}

class _LoadingCoffeeState extends State<LoadingCoffee>
    with SingleTickerProviderStateMixin {
  late AnimationController _coffeeController;
  @override
  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {});
  }

  @override
  void dispose() {
    _coffeeController.removeListener(() {});
    _coffeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/loading.json',
        controller: _coffeeController,
        height: 100,
        width: 100,
        onLoaded: (composition) {
          _coffeeController
            ..duration = composition.duration
            ..forward();
        },
      ),
    );
  }
}
