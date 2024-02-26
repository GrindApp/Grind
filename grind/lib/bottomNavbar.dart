import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/theme/app_decoration.dart';
import 'package:mohsin_s_application4/theme/custom_text_style.dart';
import 'package:mohsin_s_application4/widgets/custom_image_view.dart';

import 'GymBuddyFiles/gymbuddy.dart';
import 'HomePageFiles/HomePage.dart';
import 'core/utils/image_constant.dart';
import 'explorePageFiles/explorePage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return GymBuddy();
      case 2:
        return ExplorePage();

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedLabelColor = Color(0xFFF9545E);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0.0,
          )),
      body: SafeArea(
        child: _buildPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 35,
        backgroundColor: AppDecoration.fillPrimary.color,
        items: [
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgUserRedA200,
              height: 24,
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgGlobe,
              height: 24,
              width: 24,
            ),
            label: 'Gym Buddy',
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgGroup52982364Gray500,
              height: 24,
              width: 24,
            ),
            label: 'Explore',
          ),
        ],
        currentIndex: _currentIndex,

        selectedItemColor: selectedLabelColor,
        selectedLabelStyle:
            CustomTextStyles.labelMediumGray500.copyWith(color: Colors.blue),
        unselectedLabelStyle: CustomTextStyles.labelMediumGray500
            .copyWith(color: Colors.grey), // Unselected label style
        unselectedItemColor: Colors.grey,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
    );
  }
}
