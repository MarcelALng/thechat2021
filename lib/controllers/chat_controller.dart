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

  Future<FirebaseUser> checkIdentity(BuildContext context) async {
    final FirebaseUser _user = await _firebase.currentUser();
    if (_user == null) {
      print(_user);
      Navigator.pushReplacementNamed(context, RoutesConstant.welcome);
    } else {
      _activeUser = _user;
    }
    print(_activeUser);
    return _activeUser;
  }

  void signOut() {
    _firebase.signOut();
  }
}
