import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/bottomNavbar.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  bool _showWelcomeText = false;

  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds to show "Are you ready?" text
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showWelcomeText = true;
      });
    });

    // Redirect after 5 seconds
    Timer(const Duration(seconds: 5), () {
      checkLogIn(context);
    });
  }

  // Function to check if user is logged in or not
  void checkLogIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1E20), // Set background color here
      body: Container(
        child: Center(
          child: Text(
            _showWelcomeText ? 'Welcome To GRIND' : 'Are you ready?',
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
