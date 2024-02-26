import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohsin_s_application4/AllSideBarPages/setting.dart';

import '../theme/theme_helper.dart';
import '../widgets/custom_outlined_button.dart';
import 'changePassword.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isGoogleSignIn = false;

  late TextEditingController nameController;
  var usernameController = TextEditingController(text: "");
  late TextEditingController bioController;
  var passwordController = TextEditingController();
  var CpasswordController = TextEditingController();
  File? profilePic;
  File? viewPhoto;

  File? imageFile;
  bool isImageUploaded = false;

  bool showCurrentPassword = false;
  bool showNewPassword = false;
  bool showConfirmPassword = false;

  bool isNameChanged = false;
  bool isUsernameChanged = false;
  bool isBioChanged = false;
  late FocusNode nameFocusNode;
  late FocusNode usernameFocusNode;
  late FocusNode bioFocusNode;

  bool isBioLoaded = false;
  bool isUsernameUnique = true;
  String viewPhotoUrl = '';

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> updateName() async {}

  Future<void> updateBio() async {}

  Future<void> updateUsername() async {}

  void _cropImageProfile(File imgFile) async {}

  @override
  Widget build(BuildContext context) {
    final Color statusBarColor = theme.colorScheme.primary;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
    ));
    // bool isPhoneNumberSignIn = CheckPhoneNumberSignIn();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        leading: BackButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingPage())),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Edit Your Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: Image.network(
                              'https://i.pinimg.com/564x/bd/24/60/bd2460ac4bc99fb0f7f8d3911fc19e5d.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: const Text('Change current Photo'),
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                        showImagePickerProfile(
                                            context); // Call your function to change photo
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.delete),
                                      title: const Text('Delete Current Photo'),
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                        // deleteProfilePic(); // Call your function to delete photo
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Edit Profile Picture",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: Image.network(
                              'https://i.pinimg.com/564x/0c/35/35/0c35352597b45aa2db53b4ab1326a9e1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: const Text('Change Photo'),
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                        showImagePicker(
                                            context); // Call your function to change photo
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.delete),
                                      title: const Text('Delete Current Photo'),
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Close the bottom sheet
                                        // deleteViewPhoto(); // Call your function to delete photo
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Edit Grind Picture",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: TextFormField(
                  cursorColor: Colors.white70,
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {
                      isNameChanged = true;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  focusNode: nameFocusNode,
                  decoration: InputDecoration(
                    labelText: "NAME",
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white70),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusColor: Colors.white70,
                    suffixIcon: isNameChanged
                        ? IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: updateName,
                          )
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white70,
                controller: usernameController,
                onChanged: (value) async {
                  // bool isUnique = await checkUsernameUniqueness(value);
                  // setState(() {
                  //   isUsernameChanged = true;
                  //   isUsernameUnique = isUnique;
                  // });
                },
                style: TextStyle(color: Colors.white),
                focusNode: usernameFocusNode,
                decoration: InputDecoration(
                  labelText: "USERNAME",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white70),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusColor: Colors.white70,
                  suffixIcon: isUsernameChanged
                      ? IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: () => updateUsername(),
                        )
                      : null,
                  suffixText: isUsernameChanged
                      ? isUsernameUnique
                          ? 'Available'
                          : 'Not Available'
                      : '',
                  suffixStyle: TextStyle(
                      color: isUsernameChanged
                          ? isUsernameUnique
                              ? Colors.green
                              : Colors.red
                          : Colors.transparent),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                cursorColor: Colors.white54,
                controller: bioController,
                onChanged: (value) {
                  setState(() {
                    isBioChanged = true;
                  });
                },
                focusNode: bioFocusNode,
                maxLength: 150,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.grey),
                  labelText: "BIO",
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  suffixIcon: isBioChanged
                      ? IconButton(
                          icon: Icon(Icons.check, color: Colors.green),
                          onPressed: updateBio,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                // child: isGoogleSignIn // Conditionally show or hide "Change Password?" based on Google Sign-In
                //     ? Container() // If signed in with Google, hide the button
                //     : isPhoneNumberSignIn // Conditionally show or hide "Change Password?" based on Phone Number Sign-In
                //     ? Container() // If signed in with Phone Number, hide the button
                //     : TextButton(
                //   onPressed: () async {
                //     await Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const AuthCheck()),
                //     );
                //     // Additional code to execute after navigating (if needed)
                //   },
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (_) => ChangePassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Change Password?',
                    style: TextStyle(color: Colors.redAccent, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomOutlinedButton(
                onPressed: () {},
                text: "SAVE CHANGES",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 60.0,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                    onTap: () async {
                      await _imgFromGalleryForProfile();
                      // Close the bottom sheet after a slight delay
                      Future.delayed(const Duration(milliseconds: 200), () {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Camera",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      await _imgFromCameraForProfile();
                      // Close the bottom sheet after a slight delay
                      Future.delayed(const Duration(milliseconds: 200), () {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _imgFromGalleryForProfile() async {}

  Future<void> _imgFromCameraForProfile() async {}

  Future<void> updateProfilePic(final croppedFile) async {}

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 60.0,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                    onTap: () async {
                      await _imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Camera",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      await _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _imgFromGallery() async {}

  Future<void> _imgFromCamera() async {}

  void _cropImage(File imgFile) async {}

  void saveViewPhoto(final croppedFile) async {
    // ProgressDialog progressDialog = ProgressDialog(context);
    // progressDialog.style(
    //   message: 'Uploading Grind picture',
    // );
    //
    // User? user = FirebaseAuth.instance.currentUser;
    // String uid = user?.uid ?? '';
    //
    // if (croppedFile != null) {
    //   File convertedFile = File(croppedFile.path);
    //   progressDialog.show();
    //
    //   try {
    //     UploadTask uploadTask = FirebaseStorage.instance
    //         .ref()
    //         .child("ViewerPictures_folder")
    //         .child(const Uuid().v1())
    //         .putFile(convertedFile);
    //
    //     TaskSnapshot taskSnapshot = await uploadTask;
    //     String downloadUrl1 = await taskSnapshot.ref.getDownloadURL();
    //
    //     await FirebaseFirestore.instance.collection('users').doc(uid).update({
    //       'downloadUrl1': downloadUrl1,
    //     });
    //
    //     await user?.reload();
    //
    //     _showSnackbar('View Image Updated');
    //
    //     // Wait for the setState to complete before navigating
    //     setState(() {});
    //
    //     print("View Photo URL: $viewPhotoUrl");
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const EditProfilePage()),
    //     );
    //   } catch (error) {
    //     print("Error uploading image: $error");
    //     _showSnackbar('Error uploading image');
    //     // } finally {
    //     //   // Delay hiding the loading indicator to ensure it's visible for a short period
    //     //   Future.delayed(Duration(milliseconds: 500), () {
    //     //     progressDialog.hide();
    //     //   });
    //   }
    // } else {
    //   _showSnackbar('No image selected');
    // }
  }

  Future<void> getDownloadUrl() async {
    // try {
    //   DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
    //       .instance
    //       .collection('users')
    //       .doc(user?.uid)
    //       .get();
    //   String updatedDownloadUrl = snapshot.data()?['downloadUrl1'] ?? "";
    //
    //   setState(() {
    //     viewPhotoUrl = updatedDownloadUrl;
    //   });
    // } catch (error) {
    //   print("Error fetching download URL: $error");
    //   // Handle the error, e.g., show a default image or a placeholder
    //   setState(() {
    //     viewPhotoUrl =
    //     'https://moorepediatricnc.com/wp-content/uploads/2022/08/default_avatar.jpg';
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    getDownloadUrl();

    nameController = TextEditingController();
    bioController = TextEditingController();
    fetchNameFromFirestore();
    fetchUsernameFromFirestore();
    // fetchBioFromFirestore();
    usernameController = TextEditingController();
    nameFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
    bioFocusNode = FocusNode();
    checkGoogleSignIn();
  }

  void checkGoogleSignIn() {
    // Check if the user signed in with Google
    // isGoogleSignIn = user?.providerData
    //     .any((userInfo) => userInfo.providerId == 'google.com') ??
    //     false;
  }

  // bool CheckPhoneNumberSignIn() {
  //   // User? user = FirebaseAuth.instance.currentUser;
  //   // if (user != null) {
  //   //   // You may have additional checks based on your user model or authentication details
  //   //   return user.providerData
  //   //       .any((provider) => provider.providerId == 'phone');
  //   // }
  //   // return false;
  // }

  Future<void> fetchNameFromFirestore() async {
    // String? uid = user?.uid;
    // DocumentSnapshot<Map<String, dynamic>> snapshot =
    // await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // String name = snapshot.data()?['name'] ?? "";
    //
    // setState(() {
    //   nameController.text = name;
    // });
  }

  Future<void> fetchUsernameFromFirestore() async {
    // String? uid = user?.uid;
    // DocumentSnapshot<Map<String, dynamic>> snapshot =
    // await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // String username = snapshot.data()?['username'] ?? "";
    //
    // setState(() {
    //   usernameController.text = username;
    // });
  }

  // Future<void> fetchBioFromFirestore() async {
  //   String? uid = user?.uid;
  //   DocumentSnapshot<Map<String, dynamic>> snapshot =
  //   await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   String bio = snapshot.data()?['bio'] ?? "";
  //   setState(() {
  //     bioController = TextEditingController(text: bio);
  //   });
  // }

  @override
  void dispose() {
    nameFocusNode.dispose();
    usernameFocusNode.dispose();
    bioFocusNode.dispose();
    super.dispose();
  }

  void saveChanges() async {
    // String newPassword = passwordController.text.trim();
    // String ConfirmPassword = CpasswordController.text.trim();
    // if (newPassword == "" || ConfirmPassword == "") {
    //   _showSnackbar('Please enter New Password details');
    // } else if (newPassword != ConfirmPassword) {
    //   _showSnackbar('Password does not match');
    // } else {
    //   try {
    //     if (user != null) {
    //       await user?.updatePassword(newPassword);
    //       _showSnackbar('Changes Done');
    //     }
    //   } on FirebaseAuthException catch (ex) {
    //     _showSnackbar(ex.code.toString());
    //   }
    // }
  }
}
