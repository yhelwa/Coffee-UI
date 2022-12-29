import 'package:coffee_ui/pages/mobile/custom_scaffold.dart';
import 'package:coffee_ui/screens/intro_screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  bool _onLastPage = false;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: ((value) =>
                setState(() => _onLastPage = value == 2)),
            children: const [
              IntroScreen(
                jsonPath: 'assets/animations/login.json',
                title: 'Create your account',
              ),
              IntroScreen(
                jsonPath: 'assets/animations/coffee_machine.json',
                title: 'Order your coffee',
              ),
              IntroScreen(
                jsonPath: 'assets/animations/cute_coffee.json',
                title: 'Warm your heart',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                const SizedBox(),
                SmoothPageIndicator(
                  controller: _pageController,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                  ),
                  count: 3,
                ),
                !_onLastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.orange.shade700,
                        onPressed: (() {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 26,
                          color: Colors.white,
                        ),
                      )
                    : FloatingActionButton(
                        backgroundColor: Colors.orange.shade700,
                        onPressed: (() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CustomScaffold(selectedIndex: 0)),
                              (route) => false);
                        }),
                        child: const Icon(
                          Icons.home,
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
