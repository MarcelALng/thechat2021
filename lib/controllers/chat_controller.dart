import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:thechat2021/constants/routes_constant.dart';
// import 'package:thechat2021/constants/global_constant.dart';

class ChatController extends ChangeNotifier {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final Firestore _cloudFirestore = Firestore.instance;

  static const String _discussionCollection = "discussions";
  static const String _discussionChat = "chat";

  FirebaseUser activeUser;

  Future<QuerySnapshot> getDiscussions() {
    return _cloudFirestore.collection("discussions").getDocuments();
  }

  Stream<QuerySnapshot> getChat(String discussionId) {
    return _cloudFirestore
        .collection(_discussionCollection)
        .document(discussionId)
        .collection(_discussionChat)
        .orderBy("date", descending: true)
        .snapshots();
  }

  sendNewDiscussion(String discussionName) {
    Map<String, dynamic> _discussion = {
      "name": discussionName,
      "creatorID": activeUser.uid
    };

    _cloudFirestore.collection(_discussionCollection).add(_discussion);
    notifyListeners();
  }

  sendPostChat({@required String postChat, @required String discussionId}) {
    Map<String, dynamic> _postData = {
      'sender': activeUser.email,
      'content': postChat,
      'date': DateTime.now().toIso8601String()
    };

    _cloudFirestore
        .collection(_discussionCollection)
        .document(discussionId)
        .collection(_discussionChat)
        .add(_postData)
        .catchError((error) => print(error));
  }

  deleteDiscussion(String discussionId) {
    _cloudFirestore
        .collection(_discussionCollection)
        .document(discussionId)
        .delete()
        .then((value) {
      return notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> refreshDiscussions() async {
    notifyListeners();
    await Future<void>.delayed(Duration(seconds: 2));
    return null;
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
      activeUser = _user;
    }
    print(activeUser);
    // if (_activeUser == null) {
    //   return Future.error("L'utilisateur est null");
    // }
    return activeUser;
  }

  void signOut() {
    _firebase.signOut();
  }
}
