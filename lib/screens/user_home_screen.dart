import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/appbar_component.dart';
import 'components/floating_action_component.dart';
import 'components/alert_dialog_component.dart';
import 'package:thechat2021/controllers/chat_controller.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChatController _controller = Provider.of<ChatController>(context);

    return Scaffold(
      floatingActionButton: ComponentFloatingAction(),
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
                  return RefreshIndicator(
                    onRefresh: () => _controller.refreshDiscussions(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: discussions.data.documents.length,
                      itemBuilder: (context, item) {
                        return Column(
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              child: ListTile(
                                onLongPress: () {
                                  bool _isCreator = discussions.data
                                              .documents[item]["creatorID"] ==
                                          _controller.activeUser.uid
                                      ? true
                                      : false;
                                  if (_isCreator) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ComponentAlertDialog(
                                              discussions.data.documents[item]
                                                  .documentID);
                                        });
                                  }
                                },
                                onTap: () => Navigator.pushNamed(
                                    context, RoutesConstant.userChat,
                                    arguments: discussions
                                        .data.documents[item].documentID),
                                title: Text(
                                    discussions.data.documents[item]["name"]),
                              ),
                            ),
                            Divider(height: 1.0),
                          ],
                        );
                      },
                    ),
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
