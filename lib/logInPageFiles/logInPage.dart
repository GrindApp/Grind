import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/logInPageFiles/LogInWithPhone.dart';

import '../core/utils/image_constant.dart';
import '../signUpPageFlow/CreateUserAccount.dart';
import '../theme/custom_button_style.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                // width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(children: [
                              _buildWelcomeSection(context),
                              SizedBox(height: 10),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 16),
                                      child: Text(
                                        "Please fill the below details to get started ",
                                        style: CustomTextStyles
                                            .bodyMediumGray200
                                            .copyWith(
                                          fontSize:
                                              15.0, // Adjust the font size as needed
                                        ),
                                      ))),
                              SizedBox(height: 36),
                              _buildEmailSection(context),
                              SizedBox(height: 38),
                              _buildPasswordSection(context),
                              SizedBox(height: 36),
                              _buildLoginButtonSection(context),
                              SizedBox(height: 24),
                              CupertinoButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateUserAccount()), // Replace YourNewScreen() with the screen you want to navigate to
                                  );
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Don't have an account? ",
                                          style: CustomTextStyles
                                              .bodyMediumffededed),
                                      TextSpan(
                                          text: "Sign up",
                                          style: CustomTextStyles
                                              .titleSmallfff9545e)
                                    ]),
                                    textAlign: TextAlign.left),
                              ),
                              SizedBox(height: 23),
                              _buildSubtractSection(context),
                              SizedBox(height: 22),
                              _buildLoginWithGoogleSection(context),
                              SizedBox(height: 16),
                              _buildLoginWithPhoneSection(context),
                              SizedBox(height: 44),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: Container(
                                        width: 318,
                                        margin: EdgeInsets.only(
                                            left: 27, right: 43),
                                        child: Center(
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "By Creating An Account, You Are Agreeing To Our",
                                                    style: theme
                                                        .textTheme.bodyMedium),
                                                TextSpan(
                                                    text:
                                                        " Terms & Conditions ",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline)),
                                                TextSpan(
                                                    text: " And ",
                                                    style: theme
                                                        .textTheme.bodyMedium),
                                                TextSpan(
                                                    text: " Privacy Policy!",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline))
                                              ]),
                                              textAlign: TextAlign.center),
                                        )),
                                  )),
                              SizedBox(height: 5)
                            ])))))));
  }

  /// Section Widget
  Widget _buildWelcomeSection(BuildContext context) {
    return SizedBox(
        height: 178,
        width: 374,
        child: Stack(alignment: Alignment.centerLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle24215,
              height: 85,
              width: 301,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(bottom: 2)),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: 358,
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Welcome to",
                            style: CustomTextStyles.roboto33ffffff.copyWith(
                              fontWeight: FontWeight.w200,
                            )),
                        TextSpan(text: " "),
                        TextSpan(
                            text: "Grind",
                            style: CustomTextStyles.robotoff1c1e20.copyWith(
                              fontWeight: FontWeight.w300,
                            ))
                      ]),
                      textAlign: TextAlign.left)))
        ]));
  }

  Widget _buildEmailSection(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final focusNode = FocusNode();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomTextFormField(
        controller: emailController,
        onChanged: (val) {},
        hintText: "Email",
        obscureText: false,
        textInputType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        focusNode: focusNode,
        validator: (value) {},
        hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomTextFormField(
        controller: passwordController,
        onChanged: (val) {},
        hintText: "Password",
        textInputAction: TextInputAction.done,
        cursorColor: Colors.white,
        // obscureText: true,

        textInputType: TextInputType.visiblePassword,
        validator: (value) {},
        // Show password toggle
        showPasswordToggle: true,
        hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginButtonSection(BuildContext context) {
    return CustomOutlinedButton(
      text: "LOG IN",
      buttonTextStyle: TextStyle(color: Colors.white54, fontSize: 20),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24), // Set white border here
      ),
      // onPressed: () {
      //   FocusScope.of(context).unfocus();
      //   final email = BlocProvider.of<GymProfileReviewsOneBloc>(context)
      //       .state
      //       .emailSectionController
      //       ?.text;
      // },
    );
  }

  /// Section Widget
  Widget _buildSubtractSection(BuildContext context) {
    return SizedBox(
      height: 19,
      width: 358,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0, // Position the left divider at the left edge
            child: SizedBox(
              height: 1, // Set height of divider
              width: 150, // Set width of divider
              child: Divider(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 0, // Position the right divider at the right edge
            child: SizedBox(
              height: 1, // Set height of divider
              width: 150, // Set width of divider
              child: Divider(
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "or",
              style: CustomTextStyles.bodyLarge_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginWithGoogleSection(BuildContext context) {
    return CustomElevatedButton(
      text: "Log In with Google",
      margin: EdgeInsets.symmetric(horizontal: 16),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12),
        child: CustomImageView(
          imagePath: ImageConstant.imgFlatcoloriconsgoogle,
          height: 24,
          width: 24,
        ),
      ),
      onPressed: () {
        onTapLoginWithGoogleSection(context);
      },
    );
  }

  /// Section Widget
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

  onTapLoginWithGoogleSection(BuildContext context) async {}
}
