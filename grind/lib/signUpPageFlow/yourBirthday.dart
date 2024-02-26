import 'package:flutter/material.dart';

import '../logInPageFiles/logInPage.dart';
import '../widgets/custom_outlined_button.dart';
import 'myGender.dart';

class DateOfBirth extends StatefulWidget {
  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
                MaterialPageRoute(builder: (context) => LoginScreen())),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          // title: const Text(
          //   "SETTINGS",
          //   style: TextStyle(color: Colors.white),
          // ),
        ),
        body: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Text(
                "Add your birth date",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 100.0,
              ),
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70.0, right: 70),
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: Center(
                      child: Text(
                        'SELECT DATE',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, right: 90.0),
                child: CustomOutlinedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyGender())),
                  text: "CONTINUE",
                ),
              ),
              SizedBox(
                height: 270,
              ),
              Text(
                'Your age will be public.',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
