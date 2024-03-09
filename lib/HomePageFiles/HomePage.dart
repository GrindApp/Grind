import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../AllSideBarPages/SideBar.dart';
import '../ChatFIles/allDmsPage.dart';
import '../core/utils/image_constant.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_image_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Color selectedLabelColor = Color(0xFFF9545E);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: false,
          drawer: NavDrawer(),
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildFrame(context),
                _buildYourType(context),
                SizedBox(
                  height: 20,
                ),
                _build5StarHeading(context),
                _build5Star(context),
                _buildYourGyms(context),
                _buildGymCard(context),
                _buildGymCard1(context),
                _buildGymCard2(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 10.0, top: 15.0),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/img_user.svg',
              width: 25,
              height: 25,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        );
      },
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(
          child: Stack(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'G  ',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200,
                  ),
                ),
                TextSpan(
                  text: 'IND',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 13,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                'assets/images/img_group_52982364.svg',
                width: 45,
                height: 45,
              ),
            ),
          ),
        ],
      )),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.0, top: 15.0),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/images/img_television.svg',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => AllDmsPage(),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildProgress(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          child: Container(
            height: 340,
            width: double.infinity,
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 9,
                      right: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Steps",
                                    style: CustomTextStyles.bodyMediumGray500_1,
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgPhFootprintsFill,
                                          height: 14,
                                          width: 14,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Text(
                                          "23000",
                                          style: CustomTextStyles
                                              .headlineSmallWhiteA700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CustomDropDown(
                                width: 150,
                                icon: Container(
                                  margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgArrowdown,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                hintText: "Today",
                                items: [
                                  SelectionPopupModel(
                                      title: "Today", isSelected: false),
                                  SelectionPopupModel(
                                      title: "Yesterday", isSelected: false)
                                ],
                                // Remove the onChanged callback if it's not needed
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 174,
                          width: MediaQuery.of(context).size.width - 80,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Align(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                    left: 4,
                                    top: 3,
                                    bottom: 9,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 182,
                                        width: 182,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              left: 2,
                                              child: SizedBox(
                                                  height: 162,
                                                  width: 162,
                                                  child:
                                                      CircularStepProgressIndicator(
                                                    totalSteps: 100,
                                                    currentStep: 72,
                                                    fallbackWidth: 200,
                                                    fallbackHeight: 200,
                                                    selectedColor:
                                                        appTheme.redA200,
                                                    unselectedColor:
                                                        appTheme.cyan700,
                                                    padding: 0,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child:
                                                            LiquidCircularProgressIndicator(
                                                          value:
                                                              0.50, // Defaults to 0.5.
                                                          valueColor:
                                                              AlwaysStoppedAnimation(
                                                            appTheme.orange300,
                                                          ),
                                                          backgroundColor:
                                                              Colors.white,
                                                          borderColor: appTheme
                                                              .orange300,
                                                          borderWidth: 7.0,
                                                          direction:
                                                              Axis.vertical,
                                                        )),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 7,
                                                width: 8,
                                                margin: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appTheme.orange300,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4),
                                                child: Text(
                                                  "Target Calories",
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 7),
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 2),
                                                  child: Text(
                                                    "23%",
                                                    style: theme
                                                        .textTheme.titleSmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 7,
                                                width: 8,
                                                margin: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appTheme.redA200,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4),
                                                child: Text(
                                                  "Target Steps",
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6),
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                // Padding(
                                                //   padding:
                                                //       EdgeInsets.only(bottom: 3),
                                                //   child: Text(
                                                //     "lbl2",
                                                //     style: CustomTextStyles
                                                //         .bodySmallOnError,
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 2),
                                                  child: Text(
                                                    "1,00,000",
                                                    style: theme
                                                        .textTheme.titleSmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 14),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 7,
                                                width: 8,
                                                margin: EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appTheme.cyan700,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4),
                                                child: Text(
                                                  "Remaining",
                                                  style:
                                                      theme.textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6),
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                // Padding(
                                                //   padding:
                                                //       EdgeInsets.only(bottom: 3),
                                                //   child: Text(
                                                //     "lbl2",
                                                //     style: CustomTextStyles
                                                //         .bodySmallOnError,
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 2),
                                                  child: Text(
                                                    "77,000",
                                                    style: theme
                                                        .textTheme.titleSmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 4,
                          ),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadius.circular(
                              6,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 2),
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "You have achieved ",
                                        style:
                                            CustomTextStyles.bodySmallffffffff,
                                      ),
                                      TextSpan(
                                        text: "25%",
                                        style:
                                            CustomTextStyles.bodySmallffffc107,
                                      ),
                                      TextSpan(
                                        text: " of your goal in 3 days",
                                        style:
                                            CustomTextStyles.bodySmallffffffff,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildProgress1(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          child: Container(
            height: 340,
            width: double.infinity, // Set width to fill available space
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Goals",
                    style: CustomTextStyles.headlineSmallGray500,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "See all your this week goals here",
                    style: CustomTextStyles.bodyMediumGray500_1,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        _buildInterestsList(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgFluentTargetA,
                          height: 16,
                          width: 16,
                        ),
                        Text(
                          "6 days remaining for your next goal",
                          style: CustomTextStyles.bodySmallWhiteA700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInterestsList() {
  List<String> DailyGoals = [
    'Running',
    'Weightlifting',
    'Yoga',
    'Cycling',
    'Swimming',
    'CrossFit',
    'Zumba',
    'Home Workout',
    'Meditation',
    'Gymnastics',
    'Athletes'
  ];
  List<String> selectedInterests = [];
  void handleInterestSelection(String interest, bool selected) {
    if (selected) {
      if (selectedInterests.length < 5) {
        selectedInterests.add(interest);
      }
    } else {
      selectedInterests.remove(interest);
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8),
      Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: DailyGoals.map((interest) {
          bool isSelected = selectedInterests.contains(interest);
          Color chipColor =
              isSelected ? Colors.redAccent : Colors.grey.shade200;
          return FilterChip(
            label: Text(interest),
            selected: isSelected,
            onSelected: (bool selected) {
              handleInterestSelection(interest, selected);
            },
            selectedColor: Colors.redAccent,
            checkmarkColor: Colors.white,
            backgroundColor: chipColor,
            selectedShadowColor: Colors.black,
            showCheckmark: false,
            labelStyle: TextStyle(
              fontSize: 12,
              decoration: isSelected ? TextDecoration.lineThrough : null,
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          );
        }).toList(),
      ),
      const SizedBox(height: 8),
    ],
  );
}

Widget _buildProgress2(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          child: Container(
            height: 340,
            width: double.infinity,
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadius.circular(
                6,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                  child: Text(
                    "Track Progression",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "25%",
                        style: theme.textTheme.headlineMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 10),
                        child: SizedBox(
                          height: 32,
                          child: VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: appTheme.gray900,
                            indent: 5,
                            endIndent: 4,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "5 of 12 exercise tasks ",
                                    style: CustomTextStyles.bodyMediumffededed,
                                  ),
                                  TextSpan(
                                    text: " \n",
                                    style: CustomTextStyles.bodyMedium_1,
                                  ),
                                  TextSpan(
                                    text: "completed successfully",
                                    style: CustomTextStyles.bodySmallffededed,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: appTheme.gray900,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "Daily Progression",
                              ),
                              SizedBox(
                                width: 160,
                              ),
                              Text(
                                "4/8 days",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                            child: HeatMap(
                              colorMode: ColorMode.opacity,
                              showText: false,
                              fontSize: 0,
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 96)),
                              colorsets: {
                                1: Colors.red,
                              },
                              showColorTip: false,
                              defaultColor: Colors.white,
                              borderRadius: 3,
                              margin: EdgeInsets.all(3),
                              size: 17,
                              onClick: (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value.toString())));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildYourType(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
    child: Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      "Your Types",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgMapGym, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Weight Training",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgHealthiconsExerciseBicycle, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Cardio training",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgIcRoundSportsGymnastics, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Aerobics",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgGameIconsGymBag, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Professionals",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgIcRoundSportsGymnastics, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Dance",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgHealthiconsExerciseBicycle, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Zumba",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgHealthiconsExe, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Calisthenics",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      height: 80,
                      width: 80,
                      decoration: AppDecoration.fillPrimary,
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgHealthiconsExerciseRunning, // Assuming ImageConstant.imgMaterialSymbol is the asset path to your SVG file
                        fit: BoxFit.scaleDown, // Adjust fit as needed
                      ),
                    ),
                    Text(
                      "Meditation",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildYourGyms(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      "Nearby Gyms",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _build5StarHeading(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 24),
    child: Row(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 20),
            children: [
              TextSpan(text: 'The 5 ', style: TextStyle(color: Colors.grey)),
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: IconTheme(
                  data: IconThemeData(color: Colors.amber),
                  child: Icon(
                    Icons.star,
                    size: 15,
                  ),
                ),
              ),
              TextSpan(
                  text: " rating arenas", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _build5Star(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 20),
    child: Container(
      height: 300,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/736x/29/41/0f/29410f121018cac9049c6fd7c97fc332.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.amber),
                                  child: Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 5.0",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Martial Art and Strength Zone',
                          style: TextStyle(fontSize: 20, color: Colors.white54),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 3 kms away",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/736x/0e/58/3e/0e583ead1dfc0693450cd87be9c90ee3.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.amber),
                                  child: Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 5.0",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Planet Fitness',
                          style: TextStyle(fontSize: 20, color: Colors.white54),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 5 kms away",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/736x/65/80/96/6580964ac09998bb9432222ebcd70877.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.amber),
                                  child: Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 5.0",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'The Ultimate Muscle Gym',
                          style: TextStyle(fontSize: 20, color: Colors.white54),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 7 kms away",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/564x/eb/2e/29/eb2e29b6d1076365156615ffeb0b6c68.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.amber),
                                  child: Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 5.0",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Calisthenics Zone',
                          style: TextStyle(fontSize: 20, color: Colors.white54),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 9 kms away",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/736x/ef/30/d2/ef30d29824f206653b02b39fc2dbe9c4.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.amber),
                                  child: Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 5.0",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Yoga And Meditation House',
                          style: TextStyle(fontSize: 20, color: Colors.white54),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: " 3 kms away",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildFrame(BuildContext context) {
  PageController _pageController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);
  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Container(
      height: 370, // Set the height of the section
      child: PageView(
        controller: _pageController,
        children: [
          _buildProgress(context),
          _buildProgress1(context),
          _buildProgress2(context),
        ],
      ),
    ),
    PageViewDotIndicator(
      currentItem: 0,
      count: 3,
      unselectedColor: Colors.grey,
      selectedColor: Colors.blue,
      duration: Duration(milliseconds: 200),
      size: const Size(8, 8),
    ),
  ]);
}

Widget _buildGymCard(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 260,
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.network(
                  'https://i.pinimg.com/564x/b3/80/c0/b380c0f70f0611fc99500783f7b0dffc.jpg', // Replace this with your image URL
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity, // Adjust the fit as needed
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ultimate Fitness Club',
                          textAlign: TextAlign.left, // Center align the text
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize: 15),
                                children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 17,
                                  ),
                                ),
                              ),
                              TextSpan(text: "500 meters away "),
                              TextSpan(
                                  text: "Yoga, Zumba, Aerobics",
                                  style: TextStyle(fontWeight: FontWeight.w100))
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildGymCard1(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 260,
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.network(
                  'https://i.pinimg.com/564x/81/a3/cc/81a3cc7d4f1150ceb2d69e19648a965c.jpg', // Replace this with your image URL
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity, // Adjust the fit as needed
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Form Factory Fitness',
                          textAlign: TextAlign.left, // Center align the text
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize: 15),
                                children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 17,
                                  ),
                                ),
                              ),
                              TextSpan(text: "700 meters away "),
                              TextSpan(
                                  text: "Karate, Boxing, Aerobics",
                                  style: TextStyle(fontWeight: FontWeight.w100))
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildGymCard2(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 260,
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.network(
                  'https://i.pinimg.com/564x/63/2b/b3/632bb39a4522c7d861b5c024da3d8ee2.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity, // Adjust the fit as needed
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sweat Fitness',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize: 15),
                                children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.red),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 17,
                                  ),
                                ),
                              ),
                              TextSpan(text: "900 meters away "),
                              TextSpan(
                                  text: "KickBoxing, Zumba, Weight Lifting",
                                  style: TextStyle(fontWeight: FontWeight.w100))
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

void main() {
  runApp(HomePage());
}
