import 'package:flutter/material.dart';

import '../widgets/custom_outlined_button.dart';

class OTPSentPopup extends StatefulWidget {
  @override
  _OTPSentPopupState createState() => _OTPSentPopupState();
}

class _OTPSentPopupState extends State<OTPSentPopup> {
  List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: 358,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'OTP Sent!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'An OTP has been sent to your mobile number.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 40,
                    height: 40,
                    child: TextFormField(
                      controller: _controllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24),
                        ),
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.length > 1) {
                            _controllers[index].text = value.substring(0, 1);
                            _controllers[index].selection =
                                TextSelection.collapsed(offset: 1);
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomOutlinedButton(
                onPressed: () {
                  String otp =
                      _controllers.map((controller) => controller.text).join();
                  print('Entered OTP: $otp');
                  Navigator.of(context).pop();
                },
                text: "RESEND OTP",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
