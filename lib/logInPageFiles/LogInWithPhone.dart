import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../signUpPageFlow/OTPScreen.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';

class LogInWithPhone extends StatefulWidget {
  const LogInWithPhone({Key? key}) : super(key: key);

  @override
  State<LogInWithPhone> createState() => _LogInWithPhoneState();
}

class _LogInWithPhoneState extends State<LogInWithPhone> {
  String PhoneInput = "";

  void sendOTP() async {
    String phone = PhoneInput.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                    verificationId: verificationId,
                  )),
        );
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        log(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1C1E20),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white54),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My number is",
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                onChanged: (phone) {
                  setState(() {
                    PhoneInput = phone.completeNumber;
                  });
                },
                initialCountryCode: 'IN',
              ),
              SizedBox(height: 38),
              CustomOutlinedButton(
                onPressed: () {
                  sendOTP();
                },
                text: "SEND OTP",
              ),
              Spacer(),
              Center(
                child: Container(
                  width: 318,
                  margin: EdgeInsets.only(
                    left: 11,
                    right: 27,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "By Creating An Account, You Are Agreeing To Our",
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: " Terms & Conditions ",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: " And ",
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: " Privacy Policy!",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
