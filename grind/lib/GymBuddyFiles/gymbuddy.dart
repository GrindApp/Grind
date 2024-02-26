import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../theme/theme_helper.dart';

class GymBuddy extends StatelessWidget {
  List<CardData> cards = [
    CardData(
      name: 'John',
      age: 25,
      bio: "Hi, I am John , Good to see you",
      distance: 10,
      cardWidget: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        child: Image.network(
          'https://www.trainmag.com/wp-content/uploads/2018/12/larry-wheels-body.jpg', // Replace with your image URL
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ),
    CardData(
      name: 'Alice',
      age: 30,
      distance: 10,
      bio: "Hi, I am Alice , Good to see you",
      cardWidget: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        child: Image.network(
          'https://www.greatestphysiques.com/wp-content/uploads/2017/10/David-Laid.05.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ),
    CardData(
      name: 'Bob',
      age: 28,
      distance: 10,
      bio: "Hi, I am Bob , Good to see you",
      cardWidget: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.center,
        child: Image.network(
          "https://e1.pxfuel.com/desktop-wallpaper/198/750/desktop-wallpaper-cbum-2019-classic-physique-olympia-package-r-bodybuilding-c-bum.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CardSwiper(
          scale: 0,
          threshold: 90,
          maxAngle: 90,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          allowedSwipeDirection:
              AllowedSwipeDirection.only(left: true, right: true),
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: 150, left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: cards[index].cardWidget,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.0, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cards[index].name}',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            ' Age: ${cards[index].age}',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            ' ${cards[index].bio}',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.redAccent,
                                size: 20,
                              ),
                              Text(
                                ' ${cards[index].distance} kms',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CardData {
  final String name;
  final int age;
  final int distance;
  final String bio;
  final Widget cardWidget;

  CardData(
      {required this.name,
      required this.age,
      required this.bio,
      required this.distance,
      required this.cardWidget});
}
