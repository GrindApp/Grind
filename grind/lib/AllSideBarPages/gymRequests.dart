import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohsin_s_application4/bottomNavbar.dart';
import 'package:split_view/split_view.dart';

class GymRequests extends StatefulWidget {
  GymRequests({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _GymRequestsState createState() => _GymRequestsState();
}

class _GymRequestsState extends State<GymRequests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1C1E20),
          leading: BackButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavBar())),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Edit Your Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: SplitView(
              children: [
                SplitView(
                  viewMode: SplitViewMode.Horizontal,
                  gripSize: 1,
                  indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
                  activeIndicator: SplitIndicator(
                    viewMode: SplitViewMode.Horizontal,
                    isActive: true,
                  ),
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "FRIEND REQUEST",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/tre.svg',
                            width: 60,
                            height: 60,
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          ),
                          Text(
                            "No Requests right now",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Explore Gym Buddy",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "ADDED FRIENDS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      "https://cdn.sanity.io/images/dm4o0ui7/production/ab8622774dfd8bc6b2107656cc1d648ff48279b3-1200x600.png"),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "Mohsin Khan",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "Hello",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvdPwur0JZnfWoTMnzYCSPvDFZBHLDlXoUdIgCQYFphw&s"),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "Utkarsh Khan",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "Hii",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  // onWeightChanged: (w) => print("Horizon: $w"),
                ),
              ],
              viewMode: SplitViewMode.Vertical,
              indicator: SplitIndicator(viewMode: SplitViewMode.Vertical),
              activeIndicator: SplitIndicator(
                viewMode: SplitViewMode.Vertical,
                isActive: true,
              ),
              controller:
                  SplitViewController(limits: [null, WeightLimit(max: 0.5)]),
              onWeightChanged: (w) => print("Vertical $w"),
            ),
          ),
        ),
      ),
    );
  }
}
