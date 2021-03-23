import 'package:flutter/material.dart';

// import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'components/appbar_component.dart';

import 'package:thechat2021/controllers/chat_controller.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

class UserChatScreen extends StatefulWidget {
  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  final _controller = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(GlobalConstant.colorBackground), no need cos theme data in main dart
      appBar: ComponentAppBar(titleAppBar: ": chat screen").build(),
      body: SafeArea(
        child: Container(
          child: Text("Hello,welcome to chat screen"),
        ),
      ),
    );
  }
}
