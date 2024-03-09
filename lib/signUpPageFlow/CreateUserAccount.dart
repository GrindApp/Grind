import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_form_field.dart';

class CreateUserAccount extends StatefulWidget {
  CreateUserAccount({Key? key}) : super(key: key);

  @override
  State<CreateUserAccount> createState() => _CreateUserAccountState();
}

class _CreateUserAccountState extends State<CreateUserAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showPassword = false;
  bool _isUsernameAvailable = false;

  // void _showSnackbar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // void _checkUsernameAvailability(String username) async {
  //   // Check if the username exists in the Firestore database
  //   username = username.trim();
  //   if (username == "") {
  //     setState(() {
  //       _isUsernameAvailable = false;
  //     });
  //     return;
  //   }
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('username', isEqualTo: username)
  //       .get();
  //
  //   bool isAvailable = querySnapshot.docs.isEmpty;
  //   setState(() {
  //     _isUsernameAvailable = isAvailable;
  //   });
  // }

  void createAccount(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String username = _userController.text.trim();

    if (email == "" || password == "" || confirmPassword == "") {
      _showSnackbar(context, 'Please enter login details');
    } else if (password != confirmPassword) {
      _showSnackbar(context, 'Password does not match');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Set the display name for the user
        await userCredential.user!.updateDisplayName(username);

        // Reload the user to get the updated information
        await userCredential.user!.reload();

        // Send email verification
        await userCredential.user!.sendEmailVerification();

        // Show pop-up indicating that verification email has been sent
        _showVerificationDialog(context, email);
      } on FirebaseAuthException catch (ex) {
        _showSnackbar(context, ex.code.toString());
      }
    }
  }

  void _showVerificationDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Verification Email Sent"),
          content: Text(
              "A verification email has been sent to $email. Please verify your email before logging in."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()), // Replace HomeScreen with your desired screen after email verification
                // );
              },
            ),
          ],
        );
      },
    );
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C1E20),
          elevation: 0,
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
                    controller: _userController,
                    cursorColor: Colors.white,
                    hintText: "NAME",
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
                        controller: _emailController,
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
                    controller: _passwordController,
                    cursorColor: Colors.white,
                    hintText: "PASSWORD",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.white54),
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {},
                    obscureText: true,
                  ),
                  SizedBox(height: 38),
                  CustomTextFormField(
                    controller: _confirmPasswordController,
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
                    // onPressed: widget.onNext,
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
