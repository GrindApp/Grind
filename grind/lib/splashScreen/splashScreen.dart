import 'dart:async';

import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import '../logInPageFiles/logInPage.dart';
import '../widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void checkLogIn(BuildContext context) async {
    print('User is signed in!');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void initState() {
    super.initState(); //

    Timer(const Duration(seconds: 3), () {
      checkLogIn(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 797,
          width: double.maxFinite,
          child: Stack(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 52,
                width: 39,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 19),
              ),
              CustomImageView(
                imagePath:
                    'assets/images/Spinner-1s-266px (1).svg', // Provide your SVG file path here
                height: 300,
                width: 300,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 19),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
