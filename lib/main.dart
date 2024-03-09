import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohsin_s_application4/signUpPageFlow/pagesFlow.dart';
import 'package:mohsin_s_application4/theme/theme_helper.dart';

import 'core/utils/pref_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDuOsQPVWVAIDEILOxVGohhz4PqVjFEc-M",
      appId: "1:1053547026106:android:0ed6dfc2a71602dd8e5483",
      messagingSenderId: "1053547026106",
      projectId: "app-grind",
    ),
  );
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final Color selectedLabelColor = Color(0xFFF9545E);
    final Color statusBarColor = Color(0xFF1C1E20);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Grind',
      home: PagesFlow(),
    );
  }
}
