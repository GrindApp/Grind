import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import '../theme/custom_button_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_outlined_button.dart';
import 'LogInWithPhone.dart';

class NewLogInPage extends StatefulWidget {
  const NewLogInPage({Key? key}) : super(key: key);

  @override
  State<NewLogInPage> createState() => _NewLogInPageState();
}

class _NewLogInPageState extends State<NewLogInPage> {
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
            flex: 8,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Grind",
                      style: TextStyle(fontSize: 60, color: Colors.white),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: CustomOutlinedButton(
                        onPressed: () {},
                        text: "CREATE ACCOUNT",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => LogInWithPhone(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(60),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "By Creating An Account, You Are Agreeing To Our",
                                  style: theme.textTheme.bodyMedium),
                              TextSpan(
                                  text: " Terms & Conditions ",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline)),
                              TextSpan(
                                  text: " And ",
                                  style: theme.textTheme.bodyMedium),
                              TextSpan(
                                  text: " Privacy Policy!",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline))
                            ]),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _buildLoginWithPhoneSection(BuildContext context) {
  return CustomOutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LogInWithPhone()), // Replace YourNewScreen() with the screen you want to navigate to
        );
      },
      text: "Log In with Phone",
      margin: EdgeInsets.symmetric(horizontal: 16),
      leftIcon: Container(
          margin: EdgeInsets.only(right: 12),
          child: CustomImageView(
              imagePath: ImageConstant.imgHugeiconCommunicationOutlineCall,
              height: 24,
              width: 24)),
      buttonStyle: CustomButtonStyles.outlinePrimary,
      buttonTextStyle: theme.textTheme.bodyLarge!);
}
