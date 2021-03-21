import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/appbar_component.dart';
import 'package:thechat2021/controllers/chat_controller.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GlobalConstant.colorBackground),
      appBar:
          ComponentAppBar(titleAppBar: ": espace membre ", actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            size: 30.0,
            color: Colors.red,
          ),
          onPressed: () {
            ChatController().signOut();
            Navigator.pushReplacementNamed(context, RoutesConstant.welcome);
          },
        ),
      ]).build(),
      body: SafeArea(
        child: FutureBuilder(
          future: ChatController().checkIdentity(context),
          builder: (context, AsyncSnapshot<FirebaseUser> data) {
            if (!data.hasData) {
              return CircularProgressIndicator();
            }
            return Container(
              child: Text("Cela marche!"),
            );
          },
        ),
      ),
    );
  }
}
