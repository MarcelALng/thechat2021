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
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, item) {
                          return Column(
                            children: [
                              Container(
                                color: Colors.white,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    snapshot.data.documents[item]["content"]),
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Veuillez écrire votre message",
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        FlatButton(
                          child: Text(
                            "Envoyer",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
