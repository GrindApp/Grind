import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/signUpPageFlow/myInterests.dart';
import 'package:mohsin_s_application4/theme/app_decoration.dart';
import 'package:mohsin_s_application4/theme/custom_text_style.dart';
import 'package:mohsin_s_application4/theme/theme_helper.dart';
import 'package:mohsin_s_application4/widgets/custom_outlined_button.dart';

import 'UploadGrindPhoto.dart';

class UploadProfilePic extends StatelessWidget {
  const UploadProfilePic({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return UploadProfilePic();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF1C1E20),
              elevation: 0,
              leading: BackButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyInterests())),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 37),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add your profile picture",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 38),
                      padding:
                          EdgeInsets.symmetric(horizontal: 27, vertical: 82),
                      decoration: AppDecoration.fillPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder129),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              " Be yourself, there's no one better  ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 8),
                            Container(
                                width: 198,
                                margin: EdgeInsets.only(left: 2, right: 3),
                                child: Text(
                                  ' "Upload your photo so that people can see your true-self" ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ))
                          ])),
                  SizedBox(height: 32),
                  CustomOutlinedButton(
                      text: "SUBMIT",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadGrindPhoto()));
                      },
                      buttonTextStyle:
                          TextStyle(color: Colors.white54, fontSize: 20),
                      margin: EdgeInsets.only(left: 35, right: 34)),
                  SizedBox(height: 29),
                  Text("SKIP", style: CustomTextStyles.bodyLargeGray200),
                  SizedBox(height: 160),
                  Text(
                    'Your Picture will be visible to the added person.',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Container(
                            width: 318,
                            margin: EdgeInsets.only(right: 16),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "By Creating An Account, You Are Agreeing To Our",
                                      style: theme.textTheme.bodyMedium),
                                  TextSpan(
                                      text: " Terms & Conditions ",
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline)),
                                  TextSpan(
                                      text: " And ",
                                      style: theme.textTheme.bodyMedium),
                                  TextSpan(
                                      text: " Privacy Policy!",
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline))
                                ]),
                                textAlign: TextAlign.center)),
                      ))
                ]))));
  }
}
