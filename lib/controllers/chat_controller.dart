import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:thechat2021/constants/routes_constant.dart';

class ChatController {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final Firestore _cloudFirestore = Firestore.instance;
  FirebaseUser _activeUser;

  Future<QuerySnapshot> getDiscussions() {
    return _cloudFirestore.collection("discussions").getDocuments();
  }

  Stream<QuerySnapshot> getChat(String discussionID) {
    return _cloudFirestore
        .collection("discussions")
        .document(discussionID)
        .collection("chat")
        .snapshots();
  }

  Future<FirebaseUser> checkIdentity({
    void onAuth(),
    void onNoAuth(),
  }) async {
    final FirebaseUser _user = await _firebase.currentUser();
    if (_user == null) {
      if (onNoAuth != null) {
        // to check the function is NOT null
        // if user not signed
        onNoAuth();
        // Navigator.pushReplacementNamed(context, RoutesConstant.welcome);
      }
    } else {
      if (onAuth != null) {
        onAuth();
      }
      _activeUser = _user;
    }
    print(_activeUser);
    // if (_activeUser == null) {
    //   return Future.error("L'utilisateur est null");
    // }
    return _activeUser;
  }

  void signOut() {
    _firebase.signOut();
  }
}
