import 'package:flutter/material.dart';

import '../bottomNavbar.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import 'editProfile.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> availableInterests = [
    'Running/Jogging',
    'Weightlifting',
    'Yoga',
    'Cycling',
    'Swimming',
    'CrossFit',
    'Zumba',
    'Home Workout',
    'Powerlifting',
    'HIIT',
    'Dance',
    'Hiking',
    'Meditation',
    'Gymnastics',
    'Athletes'
  ];
  List<String> selectedInterests = [];

  double dialogDistanceRadius = 10.0;
  bool isDistanceRadiusExpanded = false;
  bool isShowMeExpanded = false;
  bool menSelected = false;
  bool womenSelected = false;
  bool bothSelected = false;
  bool isLevelOfGymBuddyExpanded = false;
  bool beginnerSelected = false;
  bool intermediateSelected = false;
  bool advancedSelected = false;
  String _userPreference = "";
  bool isInterestExpanded = false;
  @override
  Widget _buildDistanceSlider(BuildContext context) {
    return Column(
      children: [
        Text("Current Distance: ${dialogDistanceRadius.round()} kms"),
        Slider(
          value: dialogDistanceRadius,
          min: 1,
          max: 10,
          activeColor: Colors.white54,
          divisions: 9,
          label: dialogDistanceRadius.round().toString(),
          onChanged: (value) {
            setState(() {
              dialogDistanceRadius = value;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Save Changes",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget _buildInterestsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select up to 5 Interests:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
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
                      _showMaxInterestsPopup(context, selectedInterests);
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
        const SizedBox(height: 8),
      ],
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

  Widget _buildAddInterestButton(BuildContext context) {
    return ListTile(
      title: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "Save Changes",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          elevation: 0,
          leading: BackButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavBar())),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "SETTINGS",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(color: theme.colorScheme.primary),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mohsin Khan",
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => EditProfilePage(),
                                ),
                              );
                            },
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 90),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/564x/1e/a6/ce/1ea6ce814fa8e3e8754ecf67e19fce33.jpg', // Replace with your profile image URL
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ExpansionTile(
                  leading: const Icon(
                    Icons.social_distance,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "Edit Distance radius",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  trailing: isDistanceRadiusExpanded
                      ? const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey)
                      : const Icon(Icons.keyboard_arrow_right,
                          color: Colors.grey),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      isDistanceRadiusExpanded = expanded;
                    });
                  },
                  children: <Widget>[
                    if (isDistanceRadiusExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDistanceSlider(context),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ExpansionTile(
                  leading: const Icon(
                    Icons.height,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    "Show Me",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  trailing: isShowMeExpanded
                      ? const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey)
                      : const Icon(Icons.keyboard_arrow_right,
                          color: Colors.grey),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      isShowMeExpanded = expanded;
                    });
                  },
                  children: <Widget>[
                    if (isShowMeExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckboxListTile(
                              title: Text(
                                "Men",
                                style: TextStyle(color: Colors.grey),
                              ),
                              shape: CircleBorder(),
                              value: menSelected ?? (_userPreference == "Men"),
                              activeColor:
                                  menSelected ? Colors.redAccent : Colors.grey,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    menSelected = true;
                                    womenSelected = false;
                                    bothSelected = false;
                                  });
                                }
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("Women",
                                  style: TextStyle(color: Colors.grey)),
                              value:
                                  womenSelected ?? (_userPreference == "Women"),
                              activeColor: womenSelected
                                  ? Colors.redAccent
                                  : Colors.grey,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    menSelected = false;
                                    womenSelected = true;
                                    bothSelected = false;
                                  });
                                }
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("Both",
                                  style: TextStyle(color: Colors.grey)),
                              value:
                                  bothSelected ?? (_userPreference == "Both"),
                              activeColor:
                                  bothSelected ? Colors.redAccent : Colors.grey,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  setState(() {
                                    bothSelected = value;
                                    menSelected = false;
                                    womenSelected = false;
                                  });
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            if (isShowMeExpanded)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Save Changes",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ExpansionTile(
                  leading: const Icon(
                    Icons.diamond,
                    color: Colors.grey,
                  ),
                  title: const Text("Level of gym buddy",
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                  trailing: isLevelOfGymBuddyExpanded
                      ? const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey)
                      : const Icon(Icons.keyboard_arrow_right,
                          color: Colors.grey),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      isLevelOfGymBuddyExpanded = expanded;
                    });
                  },
                  children: <Widget>[
                    if (isLevelOfGymBuddyExpanded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckboxListTile(
                              title: const Text(
                                "Beginner",
                                style: TextStyle(color: Colors.grey),
                              ),
                              value: beginnerSelected,
                              activeColor: beginnerSelected
                                  ? Colors.redAccent
                                  : Colors.grey,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  setState(() {
                                    beginnerSelected = value;
                                  });
                                }
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("Intermediate",
                                  style: TextStyle(color: Colors.grey)),
                              value: intermediateSelected,
                              activeColor: intermediateSelected
                                  ? Colors.redAccent
                                  : Colors.grey,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  setState(() {
                                    intermediateSelected = value;
                                  });
                                }
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("Advanced",
                                  style: TextStyle(color: Colors.grey)),
                              value: advancedSelected,
                              activeColor: advancedSelected
                                  ? Colors.redAccent
                                  : Colors.grey,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  setState(() {
                                    advancedSelected = value;
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (isLevelOfGymBuddyExpanded)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Save Changes",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  child: ExpansionTile(
                    leading: const Icon(
                      Icons.interests,
                      color: Colors.grey,
                    ),
                    title: const Text("Interests",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    trailing: isInterestExpanded
                        ? const Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey)
                        : const Icon(Icons.keyboard_arrow_right,
                            color: Colors.grey),
                    onExpansionChanged: (expanded) {
                      setState(() {
                        isInterestExpanded = expanded;
                      });
                    },
                    children: <Widget>[
                      _buildInterestsList(),
                      _buildAddInterestButton(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
