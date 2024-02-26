import 'package:flutter/material.dart';

import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'SplashScreen2.dart';

enum Gender { MEN, WOMEN }

class PagesFlow extends StatefulWidget {
  @override
  State<PagesFlow> createState() => _PagesFlowState();
}

class _PagesFlowState extends State<PagesFlow> {
  int _currentPageIndex = 0;
  late PageController _pageController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender? _selectedGender;
  Gender? _selectedGender1;

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

  void _navigateBack() {
    if (_currentPageIndex > 0) {
      setState(() {
        _currentPageIndex--;
      });
    }
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

  // void _navigateToNextPage() {
  //   setState(() {
  //     _currentPageIndex = (_currentPageIndex + 1) % 7;
  //   });
  // }

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

  Widget _buildUserCred(BuildContext context) {
    return Center(
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
                        cursorColor: Colors.white,
                        hintText: "NAME",
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.white54),
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
                        cursorColor: Colors.white,
                        hintText: "PASSWORD",
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.white54),
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {},
                        obscureText: true,
                      ),
                      SizedBox(height: 38),
                      CustomTextFormField(
                        cursorColor: Colors.white,
                        hintText: "CONFIRM PASSWORD",
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.white54),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {},
                        obscureText: true,
                      ),
                      SizedBox(height: 32),
                      CustomOutlinedButton(
                        onPressed: () {
                          _navigateToNextPage();
                        },
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
                    ]))));
  }

  Widget _buildDOB(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Text(
            "Add your birth date",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
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
              onPressed: _navigateToNextPage,
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
    );
  }

  Widget _buildMyGender(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You are a",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
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
            height: 290,
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
    );
  }

  Widget _buildShowMe(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Show me",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
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
              onPressed: _navigateToNextPage,
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
    );
  }

  Widget _buildUploadProfilePic(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 37),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Add your profile photo",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 38),
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 82),
              decoration: AppDecoration.fillPrimary
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder129),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      " Be yourself, there's no one better  ",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 8),
                    Container(
                        width: 198,
                        margin: EdgeInsets.only(left: 2, right: 3),
                        child: Text(
                          ' "Upload your photo so that people can see your true-self" ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ))
                  ])),
          SizedBox(height: 32),
          CustomOutlinedButton(
              text: "SUBMIT",
              onPressed: _navigateToNextPage,
              buttonTextStyle: TextStyle(color: Colors.white54, fontSize: 20),
              margin: EdgeInsets.only(left: 35, right: 34)),
          SizedBox(height: 29),
          Text("SKIP", style: CustomTextStyles.bodyLargeGray200),
          SizedBox(height: 160),
          Text(
            'Your Picture will be visible to the added person.',
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Container(
                    width: 318,
                    margin: EdgeInsets.only(right: 16),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "By Creating An Account, You Are Agreeing To Our",
                              style: theme.textTheme.bodyMedium),
                          TextSpan(
                              text: " Terms & Conditions ",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  decoration: TextDecoration.underline)),
                          TextSpan(
                              text: " And ", style: theme.textTheme.bodyMedium),
                          TextSpan(
                              text: " Privacy Policy!",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  decoration: TextDecoration.underline))
                        ]),
                        textAlign: TextAlign.center)),
              ))
        ]));
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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Add your first Grind picture",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Rounded edges
              border:
                  Border.all(color: Colors.white, width: 2), // White outline
            ),
            child: Center(
              child: Text(
                ' Through Your Photo people can see how badly hot you look ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
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
  @override
  Widget build(BuildContext context) {
    Widget currentPage = _buildUserCred(context);

    switch (_currentPageIndex) {
      case 0:
        currentPage = _buildUserCred(context);
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
        currentPage = _buildUploadProfilePic(context);
        break;
      case 6:
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
