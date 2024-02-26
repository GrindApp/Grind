import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/explorePageFiles/explorePage.dart';

class StrengthTraining extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Image.network(
                    'https://hips.hearstapps.com/hmg-prod/images/walk-in-strong-crawl-out-stronger-royalty-free-image-1679069989.jpg?crop=1.00xw:1.00xh;0,0&resize=2048:*', // Replace with your image URL
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => ExplorePage()),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'STRENGTH TRAINING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Benefits of Strength Training',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Strength training provides numerous benefits for both physical and mental well-being. It helps increase muscle strength, improve metabolism, enhance bone density, and boost overall fitness.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Explore The Exercises For Beginners',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Squat",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Deadlift",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Bench Press",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Shoulder Press",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Pull-Ups",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Getting Started with Strength Training',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'If you are new to strength training, start with compound exercises like squats, deadlifts, and bench press. Begin with a weight that challenges you but allows for proper form. Gradually increase the intensity as your strength improves.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Nutrition and Strength Training',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'A well-balanced diet is crucial for supporting your strength training goals. Ensure an adequate intake of protein for muscle repair, carbohydrates for energy, and essential fats for overall health. Stay hydrated to optimize performance.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Safety and Form',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "  Prioritize safety and proper form during strength training to prevent injuries. Always warm up before your workout, use proper equipment, and listen to your body.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Tracking Progress',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Keep a workout log to track your progress. Record the exercises, sets, and weights used. Setting realistic goals and regularly reassessing your performance will help you stay motivated and make necessary adjustments to your training program.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Image.asset(
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          // Add more sections with text and images as needed
        ],
      ),
    );
  }
}
