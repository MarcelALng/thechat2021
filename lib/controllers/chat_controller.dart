import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:thechat2021/constants/routes_constant.dart';

class ChatController {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  FirebaseUser _activeUser;

  Future<FirebaseUser> checkIdentity(BuildContext context) async {
    final FirebaseUser _user = await _firebase.currentUser();
    if (_user == null) {
      Navigator.pushReplacementNamed(context, RoutesConstant.welcome);
    } else {
      _activeUser = _user;
    }
    return _activeUser;
  }

  void signOut() {
    _firebase.signOut();
  }
}
