// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  int _screen = 0;
  bool isFinished = false;
  late AnimationController _coffeeController;

  bool _loading = false;

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
                'assets/images/loading.json',
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
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(104, 74, 57, 1),
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
                            style: TextStyle(
                                color: Color.fromRGBO(224, 184, 135, 1),
                                fontSize: 20),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() => _screen = 1),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color.fromRGBO(224, 184, 135, 1),
                                fontSize: 20),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() => _screen = 2),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Restore Password',
                            style: TextStyle(
                                color: Color.fromRGBO(224, 184, 135, 1),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.8,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60)),
                    color: Colors.brown,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color.fromRGBO(229, 158, 29, 1),
                    //     Color.fromRGBO(201, 130, 0, 1),
                    //   ],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _loading = true;
                      });
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pushReplacementNamed(context, '/home');
                        _loading = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 246, 212, 1),
                              fontSize: 24),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.53,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(216, 216, 216, 1),
                            Color.fromRGBO(232, 231, 234, 1),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome back',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.brown),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'A wide of range of speciality coffees, tea and beverages.',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.brown),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: _screen == 0
                                      ? [
                                          TextFormField(
                                            style:
                                                TextStyle(color: Colors.brown),
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                              hintStyle: TextStyle(
                                                  color: Colors.brown.shade300),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 20),
                                          TextFormField(
                                            obscureText: true,
                                            controller: TextEditingController(),
                                            style:
                                                TextStyle(color: Colors.brown),
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              hintStyle: TextStyle(
                                                  color: Colors.brown.shade300),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                            ),
                                          ),
                                        ]
                                      : [
                                          TextFormField(
                                            style:
                                                TextStyle(color: Colors.brown),
                                            controller: TextEditingController(),
                                            decoration: InputDecoration(
                                              hintText: 'First Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.brown.shade300),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 20),
                                          TextFormField(
                                            controller: TextEditingController(),
                                            style:
                                                TextStyle(color: Colors.brown),
                                            decoration: InputDecoration(
                                              hintText: 'Last Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.brown.shade300),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: TextEditingController(),
                                            style:
                                                TextStyle(color: Colors.brown),
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                              hintStyle: TextStyle(
                                                  color: Colors.brown.shade300),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: TextEditingController(),
                                            obscureText: true,
                                            style:
                                                TextStyle(color: Colors.brown),
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              hintStyle: TextStyle(
                                                  color: Colors.brown.shade300),
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.brown),
                                              ),
                                            ),
                                          ),
                                        ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage('assets/images/login.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: -250,
                  top: 0,
                  right: 0,
                  bottom: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _screen == 0
                          ? Container(
                              height: 100,
                              width: 45,
                              margin:
                                  EdgeInsets.only(top: 40, left: 40, right: 40),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(104, 74, 57, 1),
                                // border: Border.all(color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(45, 100)),
                              ),
                              child: Center(
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromRGBO(224, 184, 135, 1),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Text(''),
                                ),
                              ),
                            )
                          : Container(height: 100),
                      _screen == 1
                          ? Container(
                              height: 100,
                              width: 45,
                              margin:
                                  EdgeInsets.only(top: 40, left: 40, right: 40),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(104, 74, 57, 1),
                                // border: Border.all(color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(45, 100)),
                              ),
                              child: Center(
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromRGBO(224, 184, 135, 1),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Text(''),
                                ),
                              ),
                            )
                          : Container(height: 100),
                      _screen == 2
                          ? Container(
                              height: 100,
                              width: 45,
                              margin:
                                  EdgeInsets.only(top: 40, left: 40, right: 40),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(104, 74, 57, 1),
                                // border: Border.all(color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(45, 100)),
                              ),
                              child: Center(
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromRGBO(224, 184, 135, 1),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Text(''),
                                ),
                              ),
                            )
                          : Container(height: 100),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
