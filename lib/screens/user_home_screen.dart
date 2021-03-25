import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/appbar_component.dart';
import 'package:thechat2021/controllers/chat_controller.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

class UserHomeScreen extends StatelessWidget {
  final _controller = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          ComponentAppBar(titleAppBar: ": espace membre ", actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            size: 30.0,
            color: Colors.red,
          ),
          onPressed: () {
            _controller.signOut();
            Navigator.pushReplacementNamed(context, RoutesConstant.welcome);
          },
        ),
      ]).build(),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SafeArea(
          child: FutureBuilder(
            future: _controller.checkIdentity(
                onNoAuth: () => Navigator.pushNamedAndRemoveUntil(context,
                    RoutesConstant.welcome, (Route<dynamic> route) => false)),
            builder: (context, AsyncSnapshot<FirebaseUser> data) {
              if (!data.hasData) {
                return CircularProgressIndicator();
              }
              return FutureBuilder(
                future: _controller.getDiscussions(),
                builder: (context, AsyncSnapshot<QuerySnapshot> discussions) {
                  if (!discussions.hasData) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: discussions.data.documents.length,
                    itemBuilder: (context, item) {
                      return Column(
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              onTap: () => Navigator.pushNamed(
                                  context, RoutesConstant.userChat,
                                  arguments: "tests"),
                              title: Text(
                                  discussions.data.documents[item]["name"]),
                            ),
                          ),
                          Divider(height: 1.0),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
