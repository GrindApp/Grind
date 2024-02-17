import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../core/utils/image_constant.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_image_view.dart';
import 'models/chipviewframe_item_model.dart';
import 'models/frame_52984521_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          child: _buildFrame(context),
          // child: CarouselSlider(
          //   options: CarouselOptions(
          //     autoPlay: true,
          //     aspectRatio: 2.0,
          //     enlargeCenterPage: true,
          //   ),
          //   items: imageSliders, // Replace with your progress widgets list
          // ),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildAppBar() {
  return AppBar(
    elevation: 0, // Set elevation to 0 to remove 3D effect
    backgroundColor: Colors.transparent, // Set background color to transparent
    leading: Padding(
      padding: EdgeInsets.only(left: 10, top: 15.0),
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/images/img_user.svg',
          width: 40,
          height: 40,
        ),
        onPressed: () {},
      ),
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
            'assets/images/img_television.svg', // Path to your SVG file
            width: 40,
            height: 40,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}

Widget _buildProgress(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
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
            width: screenWidth - 35,
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadius.circular(
                6,
              ),
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

Widget _buildProgress2(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
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
            width: screenWidth - 35,
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
                                width: 130,
                              ),
                              Text(
                                "4/8 days",
                              ),
                            ],
                          ),
                        ),
                        Container(
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
    padding: const EdgeInsets.only(top: 10.0),
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
              width: screenWidth - 35,
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadius.circular(
                  6,
                ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyCheckbox(text: "Yoga"),
                              MyCheckbox(text: "Zumba"),
                              MyCheckbox(text: "Yoga"),
                            ],
                          ),
                          Row(
                            children: [
                              MyCheckbox(text: "Yoga"),
                              MyCheckbox(text: "Zumba"),
                              MyCheckbox(text: "Yoga"),
                            ],
                          ),
                          Row(
                            children: [
                              MyCheckbox(text: "Yoga"),
                              MyCheckbox(text: "Zumba"),
                              MyCheckbox(text: "Yoga"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
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
                    ),
                  ],
                ),
              )),
        ),
      ],
    ),
  );
}

Widget _buildFrame(BuildContext context) {
  return PageView(
    children: [
      _buildProgress(context),
      _buildProgress1(context),
      _buildProgress2(context),
    ],
  );
}

void main() {
  runApp(HomePage());
}
