import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mohsin_s_application4/signUpPageFlow/pagesFlow.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;

  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_secondsRemaining == 0) {
        _timer?.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void resendOtp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => OtpScreen(
                verificationId: widget.verificationId,
              )),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('New OTP sent to your mobile number'),
      ),
    );

    // Start timer again
    setState(() {
      _secondsRemaining = 30;
    });
    startTimer();
  }

  void verifyOTp(String verificationCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: verificationCode);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      String? uid = userCredential.user?.uid;

      // Check if the user exists in Firestore
      bool userExists = await doesUserExist(uid!);

      if (userExists) {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => BottomNavBar()));

        log("Exists");
      } else if (userCredential.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PagesFlow()));
      }
    } on FirebaseAuthException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid Otp"),
        ),
      );
      log(ex.code.toString());
    }
  }

  Future<bool> doesUserExist(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    return snapshot.exists;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Flexible(
              flex: 7,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 36,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Verify your number ",
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Enter the code we've sent by text to your number"),
                      SizedBox(
                        height: 20,
                      ),
                      OtpTextField(
                        numberOfFields: 6,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        fillColor: Colors.white,
                        focusedBorderColor: Colors.redAccent,
                        textStyle: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: Text("Verification Code"),
                          //         content:
                          //             Text('Code entered is $verificationCode'),
                          //       );
                          //     });

                          verifyOTp(verificationCode);
                          print("Otp filled");
                        }, // end onSubmit
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed:
                                  _secondsRemaining == 0 ? resendOtp : null,
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.white),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    Size(240, 50)), // Button size
                              ),
                              child: Text(
                                "RESEND OTP",
                                style: TextStyle(
                                    color: _secondsRemaining == 0
                                        ? Colors.red
                                        : Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Resend OTP in $_secondsRemaining seconds",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
