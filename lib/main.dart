import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohsin_s_application4/theme/theme_helper.dart';

import 'HomePageFiles/HomePage.dart';
import 'core/utils/pref_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Grind',
      home: HomePage(),
    );
  }
}
