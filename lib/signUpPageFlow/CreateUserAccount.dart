import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/signUpPageFlow/UploadProfilePic.dart';

import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_form_field.dart';

class CreateUserAccount extends StatelessWidget {
  CreateUserAccount({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Create Account',
            style:
                TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
          ),
          iconTheme: IconThemeData(color: Colors.white54),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 36,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    cursorColor: Colors.white,
                    hintText: "USERNAME",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    validator: (value) {
                      // if (!isText(value)) {
                      //   return "err_msg_please_enter_valid_text".tr;
                      // }
                      // return null;
                    },
                  ),
                  SizedBox(height: 38),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        cursorColor: Colors.white,
                        hintText: "EMAIL",
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {},
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.white54),
                      ),
                      SizedBox(
                          height:
                              6), // Adjust spacing between the TextFormField and the text
                      Text(
                        "We will send you a mail to verify your email",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10), // Adjust text color as needed
                      ),
                    ],
                  ),
                  SizedBox(height: 44),
                  CustomTextFormField(
                    cursorColor: Colors.white,
                    hintText: "PASSWORD",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {},
                    obscureText: true,
                  ),
                  SizedBox(height: 38),
                  CustomTextFormField(
                    cursorColor: Colors.white,
                    hintText: "CONFIRM PASSWORD",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {},
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  CustomOutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return UploadProfilePic();
                        },
                      );
                    },
                    text: "CREATE ACCOUNT",
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
        ),
      ),
    );
  }
}
