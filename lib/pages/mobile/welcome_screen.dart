// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:coffee_ui/screens/login_screen.dart';
import 'package:coffee_ui/screens/sign_up_screen.dart';
import 'package:coffee_ui/widgets/custom_button.dart';
import 'package:coffee_ui/widgets/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  int _screen = 0;
  bool isFinished = false;
  bool _loading = false;
  late AnimationController _coffeeController;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _loading
          ? Center(
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
            )
          : Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    //  Color.fromRGBO(104, 74, 57, 1),
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color.fromRGBO(104, 74, 57, 1),
                    //     Color.fromRGBO(72, 45, 30, 1),
                    //   ],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => setState(() => _screen = 0),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() => _screen = 1),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() => _screen = 2),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Restore Password',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(14, 17, 21, 1),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60)),
                  ),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _screen == 0 ? LoginScreen() : SignUpScreen(),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'or continue with',
                                  style: TextStyle(color: Colors.grey.shade200),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SquareTile(
                                iconPath: 'assets/icons/google.svg',
                                onTap: () {},
                              ),
                              SquareTile(
                                iconPath: 'assets/icons/apple.svg',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -270,
                  top: 0,
                  right: 0,
                  bottom: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _screen == 0
                          ? EllipticalContainter()
                          : Container(height: 100),
                      _screen == 1
                          ? EllipticalContainter()
                          : Container(height: 100),
                      _screen == 2
                          ? EllipticalContainter()
                          : Container(height: 100),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class EllipticalContainter extends StatelessWidget {
  const EllipticalContainter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 45,
      margin: EdgeInsets.only(top: 40, left: 40, right: 40),
      decoration: BoxDecoration(
        // color: Colors.grey.shade900,
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.2),
            Colors.grey.shade900,
          ],
          stops: [0.5, 0.5],
        ),
        // border: Border.all(color: Colors.black, width: 0.0),
        borderRadius: BorderRadius.all(Radius.elliptical(45, 100)),
      ),
      child: Center(
        child: Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          child: Text(''),
        ),
      ),
    );
  }
}
