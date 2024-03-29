// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class verifyEmail extends StatefulWidget {
//   const verifyEmail({Key? key}) : super(key: key);
//
//   @override
//   State<verifyEmail> createState() => _verifyEmailState();
// }
//
// class _verifyEmailState extends State<verifyEmail> {
//   bool isEmailVerified = false;
//   bool canResendEmail = false;
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//
//     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//
//     if (!isEmailVerified) {
//       sendVerficationEmail();
//
//       timer = Timer.periodic(
//         const Duration(seconds: 3),
//         (_) => checkEmailVerfied(),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//
//     super.dispose();
//   }
//
//   Future checkEmailVerfied() async {
//     await FirebaseAuth.instance.currentUser!.reload();
//
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//
//     if (isEmailVerified) timer?.cancel();
//   }
//
//   Future sendVerficationEmail() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser!;
//       await user.sendEmailVerification();
//
//       setState(() {
//         canResendEmail = false;
//       });
//       await Future.delayed(const Duration(seconds: 5));
//       setState(() {
//         canResendEmail = true;
//       });
//     } catch (e) {
//       print("error");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) => isEmailVerified
//       ? const userInfo()
//       : Scaffold(
//           appBar: AppBar(
//             title: const Text('verify email'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const Text(
//                   'A verification email has been sent to your email',
//                   style: TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size.fromHeight(50),
//                     ),
//                     onPressed: canResendEmail ? sendVerficationEmail : null,
//                     icon: const Icon(
//                       Icons.email,
//                       size: 32,
//                     ),
//                     label: const Text('Resent Email')),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 TextButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                   child: const Text(
//                     'cancel',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   onPressed: () => FirebaseAuth.instance.signOut(),
//                 )
//               ],
//             ),
//           ),
//         );
// }
