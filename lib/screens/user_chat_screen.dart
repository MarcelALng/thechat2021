import 'package:flutter/material.dart';

// import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'components/appbar_component.dart';

import 'package:thechat2021/controllers/chat_controller.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

class UserChatScreen extends StatefulWidget {
  final String discussionId;

  UserChatScreen({@required this.discussionId});
  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.discussionId);
    return Scaffold(
      appBar: ComponentAppBar(titleAppBar: ": chat screen").build(),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: ChatController().getChat(widget.discussionId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: Text(" Pas de données pour cette discussion."),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, item) {
                    return Container(
                      child: Text(snapshot.data.documents[item]["content"]),
                    );
                  });
            }),
      ),
    );
  }
}
