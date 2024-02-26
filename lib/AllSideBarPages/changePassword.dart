import 'package:flutter/material.dart';

import '../widgets/custom_outlined_button.dart';
import 'editProfile.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfilePage())),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "CHANGE YOUR PASSWORD",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
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
            ),
            const SizedBox(height: 15.0),
            TextField(
              cursorColor: Colors.white54,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey),
                labelText: "PASSWORD",
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
            const SizedBox(height: 40.0),
            CustomOutlinedButton(
              onPressed: () {},
              height: 50,
              text: "AUTHENTICATE",
            ),
          ],
        ),
      ),
    );
  }
}
