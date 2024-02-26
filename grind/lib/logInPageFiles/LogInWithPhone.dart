import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'OtpPopUp.dart';

class LogInWithPhone extends StatelessWidget {
  const LogInWithPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'LOG IN WITH MOBILE',
            style:
                TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
          ),
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
              CustomTextFormField(
                cursorColor: Colors.white,
                hintText: "MOBILE NUMBER",
                hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                validator: (value) {
                  // Your validation logic here
                },
              ),
              SizedBox(height: 38),
              CustomOutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OTPSentPopup();
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
    );
  }
}
