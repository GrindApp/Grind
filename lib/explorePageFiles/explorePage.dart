import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/explorePageFiles/cardioFiles/cardio.dart';
import 'package:mohsin_s_application4/explorePageFiles/strengthTrainingFiles/strengthTraining.dart';
import 'package:mohsin_s_application4/explorePageFiles/stretchingFiles/stretching.dart';
import 'package:mohsin_s_application4/explorePageFiles/yogaFiles/yogaPage.dart';

import '../theme/theme_helper.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final Color statusBarColor = Color(0xFF1C1E20);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: statusBarColor,
          title: Text(
            'Explore Now',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: theme.colorScheme.primary,
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Image.network(
                          'https://i.pinimg.com/564x/80/e3/15/80e315fde185da3d9ba274421ea50556.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StrengthTraining()),
                            );
                          },
                          child: Text(
                            'STRENGTH TRAINING',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: theme.colorScheme.primary,
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Image.network(
                          'https://i.pinimg.com/564x/ca/35/06/ca3506c9125b5c87f8b30192c7a1a94f.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Yoga()),
                            );
                          },
                          child: Text(
                            'YOGA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: theme.colorScheme.primary,
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Image.network(
                          'https://i.pinimg.com/564x/ab/a1/1c/aba11c56ed3f259f4970ab9c0be43d4b.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Cardio()),
                            );
                          },
                          child: Text(
                            'CARDIO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: theme.colorScheme.primary,
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Image.network(
                          'https://i.pinimg.com/736x/db/da/0d/dbda0d726b46287b8fcaf4ab9efc52ad.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Stretching()),
                            );
                          },
                          child: Text(
                            'STRETCHING',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: theme.colorScheme.primary,
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Image.network(
                          'https://i.pinimg.com/736x/ef/6b/7b/ef6b7b522f6264327ce795d83f72afa8.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ENDURANCE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: theme.colorScheme.primary,
                  ),
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                        child: Image.network(
                          'https://i.pinimg.com/564x/67/e0/75/67e0754d36a3959ab7f5c77f6a01b369.jpg', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'PUSH WORKOUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
