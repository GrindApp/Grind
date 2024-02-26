import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bottomNavbar.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';

class NeedHelp extends StatefulWidget {
  @override
  State<NeedHelp> createState() => _NeedHelpState();
}

final TextEditingController nameInputController = TextEditingController();
final TextEditingController emailInputController = TextEditingController();
final TextEditingController messageInputController = TextEditingController();
final TextEditingController subjectInputController = TextEditingController();

class _NeedHelpState extends State<NeedHelp> {
  void clearFields() {
    nameInputController.clear();
    emailInputController.clear();
    messageInputController.clear();
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final Color statusBarColor = theme.colorScheme.primary;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1E20),
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => BottomNavBar())),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "YOUR QUERY",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              controller: nameInputController,
              cursorColor: Colors.white54,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey),
                labelText: "NAME",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: emailInputController,
              cursorColor: Colors.white54,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey),
                labelText: "EMAIL",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(color: Colors.red),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: subjectInputController,
              cursorColor: Colors.white54,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey),
                labelText: "SUBJECT",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              cursorColor: Colors.white54,
              controller: messageInputController,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey),
                labelText: "YOUR QUERY",
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(color: Colors.red),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32.0),
            CustomOutlinedButton(
              onPressed: () {
                if (nameInputController.text.isNotEmpty &&
                    emailInputController.text.isNotEmpty &&
                    messageInputController.text.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thank you!'),
                        content: const Text('Your Query has been sent.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  clearFields();
                  hideKeyboard(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please fill all the details'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Okay'))
                        ],
                      );
                    },
                  );
                }
              },
              text: "SUBMIT",
            ),
          ],
        ),
      ),
    );
  }
}

//Sending email through emailjs functionality
// Future sendEmail() async {
//   String serviceId = dotenv.get("SERVICE_ID", fallback: "");
//   String templateId = dotenv.get("TEMPLATE_ID", fallback: "");
//   String publicKey = dotenv.get("PUBLIC_KEY", fallback: "");
//   String privateKey = dotenv.get("PRIVATE_KEY", fallback: "");
//
//   print("Sent");
//
//   //User details are here
//
//   Map<String, dynamic> templateParams = {
//     "name": nameInputController.text,
//     "subject": subjectInputController.text,
//     "message": messageInputController.text,
//     "user_email": emailInputController.text,
//   };
//
//   try {
//     await EmailJS.send(
//       serviceId,
//       templateId,
//       templateParams,
//       Options(
//         publicKey: publicKey,
//         privateKey: privateKey,
//       ),
//     );
//     print('SUCCESS!');
//   } catch (error) {
//     print(error.toString());
//   }
// }
