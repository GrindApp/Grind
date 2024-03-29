import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'model/message.dart';

class ChatService extends ChangeNotifier {
//   get instance of auth and firebase.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseMessaging messageNotif = FirebaseMessaging.instance;
  late String pushToken;

//   Send Message Functionality
  Future<void> sendMessage(String receiverId, String message) async {
    //   get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = TimeStamp.now();

    //   create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    //   construct chat room id from current user id and receiver id (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // sort the ids as this ensures that chat room id remains same for any pair of people. For example - Sam & Beth will be same as Beth & Sam.
    String chatRoomId = ids.join(
        "_"); // combine the ids into a single string to use it as chat room id.

    //   add new message to database
    // await _firestore
    //     .collection('chat_rooms')
    //     .doc(chatRoomId)
    //     .collection('messages')
    //     .add(newMessage.toMap());
  }

//   Get Message Functionality

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();

    String chatRoomId = ids.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> getFirebaseMessagingToken() async {
    await messageNotif.requestPermission();

    await messageNotif.getToken().then((t) {
      if (t != null) {}
    });
  }
}
