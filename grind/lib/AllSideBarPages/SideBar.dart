import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohsin_s_application4/AllSideBarPages/setting.dart';
import 'package:mohsin_s_application4/HomePageFiles/gymPage.dart';

import '../logInPageFiles/logInPage.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import 'QueryPage.dart';
import 'gymRequests.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.1),
      child: Drawer(
        backgroundColor: theme.colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.only(top: 30.0),
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ListTile(
                tileColor: Colors.black45,
                selectedTileColor: Colors.black45,
                focusColor: Colors.black45,
                leading: Icon(
                  Icons.person,
                  color: Colors.white38,
                ),
                title: Text('My Profile',
                    style: TextStyle(color: Colors.white38, fontSize: 19)),
                trailing:
                    Icon(Icons.keyboard_arrow_down, color: Colors.white38),
                onTap: () => {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.white38,
              ),
              title: Text(
                'Gym Buddies',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () => {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => GymRequests(),
                  ),
                ),
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white38,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () => {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => SettingPage(),
                  ),
                ),
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.white38,
              ),
              title: Text(
                'Need Help',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () => {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => NeedHelp(),
                  ),
                ),
              },
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white38,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () => _showLogoutConfirmationDialog(context),
            ),
            SizedBox(
              height: 260,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    'Grind Association 2024',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: theme.colorScheme.primary,
            title: Text(
              "LOG OUT",
              style:
                  TextStyle(color: Colors.white54, fontWeight: FontWeight.w500),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "Are you sure you want to logout?",
                    style: TextStyle(
                        color: Colors.white54, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align buttons to start and end
                children: [
                  CustomOutlinedButton(
                    width: 155,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => GymPage()),
                      );
                    },
                    text: "NO",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomOutlinedButton(
                    width: 155,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    text: "YES",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
