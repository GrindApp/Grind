import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/signUpPageFlow/UploadProfilePic.dart';

import '../widgets/custom_outlined_button.dart';
import 'SplashScreen2.dart';

class UploadGrindPhoto extends StatefulWidget {
  const UploadGrindPhoto({Key? key}) : super(key: key);

  @override
  State<UploadGrindPhoto> createState() => _UploadGrindPhotoState();
}

class _UploadGrindPhotoState extends State<UploadGrindPhoto> {
  List<String> _uploadedPhotos = []; // List to store uploaded photo URLs

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C1E20),
          elevation: 0,
          leading: BackButton(
            onPressed: () {
              BackButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadProfilePic())),
              );
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add your Grind picture",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Rounded edges
                  border: Border.all(
                      color: Colors.white, width: 2), // White outline
                ),
                child: Center(
                  child: Text(
                    ' Through Your Photo people can see how badly hot you look ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, right: 90.0),
                child: CustomOutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen2()));
                  },
                  text: "SUBMIT",
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle adding photo button press
              // This could open a dialog or navigate to another screen for photo selection
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
