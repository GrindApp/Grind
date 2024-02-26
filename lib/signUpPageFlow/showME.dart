import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/signUpPageFlow/myInterests.dart';

import '../widgets/custom_outlined_button.dart';
import 'myGender.dart';

enum Gender { MEN, WOMEN, EVERYONE }

class ShowMe extends StatefulWidget {
  const ShowMe({Key? key}) : super(key: key);

  @override
  State<ShowMe> createState() => _ShowMeState();
}

class _ShowMeState extends State<ShowMe> {
  Gender? _selectedGender1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1E20),
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyGender())),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show me",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Gender.values.map((gender) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    label: Text(
                      genderToString(gender),
                      style: TextStyle(fontSize: 30.0),
                    ),
                    selected: _selectedGender1 == gender,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedGender1 = selected ? gender : null;
                      });
                    },
                    selectedColor: Colors.redAccent,
                    checkmarkColor: Colors.white,
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90.0),
              child: CustomOutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyInterests()));
                },
                text: "CONTINUE",
              ),
            ),
            SizedBox(
              height: 290,
            ),
            Text(
              '',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.MEN:
        return 'MEN';
      case Gender.WOMEN:
        return 'WOMEN';
      case Gender.EVERYONE:
        return 'EVERYONE';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: ShowMe(),
  ));
}
