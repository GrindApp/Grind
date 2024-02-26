import 'dart:ui';

import 'package:flutter/material.dart';

import '../explorePage.dart';

class Stretching extends StatelessWidget {
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
                    'https://i0.wp.com/www.caryortho.com/wp-content/uploads/2018/10/7-Stretching-Mistakes-and-How-to-Avoid-Them.jpg?fit=800%2C485&ssl=1',
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
                      'STRETCHING',
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
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Benefits of Stretching',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Incorporating stretching into your routine offers various benefits. Stretching helps improve flexibility, increases range of motion, reduces muscle tension, enhances circulation, and promotes better posture. It is an essential component for overall muscle and joint health.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Types of Stretches',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Static Stretching",
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
                          child: Text("Dynamic Stretching",
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
                          child: Text(
                            "PNF(Proprioceptive Neuro Facilitation)",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Ballistic Stretching",
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
                  'Tips for Effective Stretching',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Warm-Up First: Always warm up your body with light aerobic activity before stretching.\n2. Target Major Muscle Groups: Focus on stretching major muscle groups to improve overall flexibility.\n3. Hold Each Stretch: Hold static stretches for 15-30 seconds; avoid bouncing.\n4. Breathe: Remember to breathe deeply and consistently during each stretch.\n5. Gradual Progression: Start with easier stretches and gradually progress to more advanced ones.\n6. Consistency is Key: Incorporate stretching into your routine regularly for long-term benefits.',
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
