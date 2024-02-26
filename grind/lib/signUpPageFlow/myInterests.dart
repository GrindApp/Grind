import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/signUpPageFlow/showME.dart';

import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import 'UploadProfilePic.dart';

class MyInterests extends StatefulWidget {
  const MyInterests({Key? key}) : super(key: key);

  @override
  State<MyInterests> createState() => _MyInterestsState();
}

class _MyInterestsState extends State<MyInterests> {
  List<String> availableInterests = [
    'Running/Jogging',
    'Movies',
    'Weightlifting',
    'Yoga',
    'Travel',
    'Cycling',
    'Calisthenics',
    'Wrestling',
    'Swimming',
    'CrossFit',
    'Kick Boxing',
    'Gaming',
    'Keto Diet',
    'Muay Thai',
    'Mix Martial Arts',
    'Zumba',
    'Home Workout',
    'Powerlifting',
    'Low carbs diet',
    'Taekwondo',
    'Spirituality',
    'Karate',
    'HIIT',
    'Dance',
    'Boxing',
    'Fasting',
    'Hiking',
    'Meditation',
    'Gymnastics',
    'Athletes',
  ];
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1C1E20),
          elevation: 0,
          leading: BackButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ShowMe())),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Interests",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                const Text(
                  'Select up to 5 Interests:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: availableInterests.map((interest) {
                    bool isSelected = selectedInterests.contains(interest);
                    return FilterChip(
                      label: Text(interest),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            if (selectedInterests.length < 5) {
                              selectedInterests.add(interest);
                            } else {
                              _showMaxInterestsPopup(
                                  context, selectedInterests);
                            }
                          } else {
                            selectedInterests.remove(interest);
                          }
                        });
                      },
                      selectedColor: Colors.redAccent,
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadProfilePic()));
                    },
                    text: "CONTINUE",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMaxInterestsPopup(
      BuildContext context, List<String> selectedInterests) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            backgroundColor: theme.colorScheme.primary,
            title: const Text(
              "Max Interests Reached",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey, // Customize the color
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "You can only select up to 5 interests.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Selected Interests:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: selectedInterests
                      .map(
                        (interest) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                interest,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            actions: [
              CustomOutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: "OKAY",
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
          ),
        );
      },
    );
  }
}
