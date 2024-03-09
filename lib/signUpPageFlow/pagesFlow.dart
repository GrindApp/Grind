import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import 'SplashScreen2.dart';

enum Gender { MEN, WOMEN }

enum ShowGender { MEN, WOMEN, EVERYONE }

class PagesFlow extends StatefulWidget {
  late final String verificationId;

  @override
  State<PagesFlow> createState() => _PagesFlowState();
}

class _PagesFlowState extends State<PagesFlow> {
  int _currentPageIndex = 0;
  late PageController _pageController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender? _selectedGender;
  ShowGender? _selectedGender1;
  String verificationId = '';

  late DateTime selectedDate;

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

  void _navigateToNextPage() {
    if (_currentPageIndex < 6) {
      setState(() {
        _currentPageIndex++;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.MEN:
        return 'MAN';
      case Gender.WOMEN:
        return 'WOMAN';
    }
  }

  String ShowGenderToString(ShowGender gender) {
    switch (gender) {
      case ShowGender.MEN:
        return 'MEN';
      case ShowGender.WOMEN:
        return 'WOMEN';
      case ShowGender.EVERYONE:
        return 'EVERYONE';
    }
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

  Widget _buildUserName(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "What's your first name?",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey
                            .withOpacity(0.1), // Grey with transparency
                        borderRadius:
                            BorderRadius.circular(8), // Optional: border radius
                      ),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Add your first name',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          // Handle the name input
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90, right: 90.0),
                    child: CustomOutlinedButton(
                      onPressed: _navigateToNextPage,
                      text: "CONTINUE",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Container(),
        ),
      ],
    );
  }

  Widget _buildDOB(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight - 300,
      child: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Text(
              "Add your birth date",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                child: Text(
                  "Your Age is - ${calculateAge(selectedDate)} years",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
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
              height: 30.0,
            ),
            Text(
              'Your age will be public.',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90.0),
              child: CustomOutlinedButton(
                onPressed: _navigateToNextPage,
                text: "CONTINUE",
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    final age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      return age - 1;
    }
    return age;
  }

  Widget _buildMyGender(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight - 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You are a",
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
                    selected: _selectedGender == gender,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedGender = selected ? gender : null;
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
                onPressed: _navigateToNextPage,
                text: "CONTINUE",
              ),
            ),
            SizedBox(
              height: screenHeight - 500,
            ),
            Text(
              'Your gender will be public.',
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

  Widget _buildShowMe(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight - 300,
      child: Center(
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
              children: ShowGender.values.map((gender) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    label: Text(
                      ShowGenderToString(gender),
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
                onPressed: _navigateToNextPage,
                text: "CONTINUE",
              ),
            ),
            SizedBox(
              height: screenHeight - 500,
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

  Widget _buildInterests(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20.0, top: 50),
          child: Column(
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
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, right: 90.0),
                child: CustomOutlinedButton(
                  onPressed: _navigateToNextPage,
                  text: "CONTINUE",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrindPhoto(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Add Your Grind Pictures",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              print('Plus tapped');
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              print('Plus tapped');
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              print('Plus tapped');
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              print('Plus tapped');
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90.0),
            child: CustomOutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashScreen2()));
              },
              text: "SUBMIT",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage = _buildUserName(context);

    switch (_currentPageIndex) {
      case 0:
        currentPage = _buildUserName(context);
        break;
      case 1:
        currentPage = _buildDOB(context);
        break;
      case 2:
        currentPage = _buildMyGender(context);
        break;
      case 3:
        currentPage = _buildShowMe(context);
        break;
      case 4:
        currentPage = _buildInterests(context);
        break;
      case 5:
        currentPage = _buildGrindPhoto(context);
        break;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.3),
              child: FractionallySizedBox(
                widthFactor: (_currentPageIndex + 1) / 7,
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 5,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: currentPage,
            ),
            SizedBox(height: 20),
            // Progress Indicator
          ],
        ),
      ),
    );
  }
}
