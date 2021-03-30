import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';

import 'components/appbar_component.dart';
import 'components/chat_builder_component.dart';
import 'package:thechat2021/controllers/chat_controller.dart';

// import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

class UserChatScreen extends StatelessWidget {
  final String discussionId;

  UserChatScreen({@required this.discussionId});

  @override
  Widget build(BuildContext context) {
    final ChatController _controller = Provider.of<ChatController>(context);

    return Scaffold(
      appBar: ComponentAppBar(titleAppBar: ": chat screen").build(),
      body: SafeArea(
        child: FutureBuilder(
          future: _controller.checkIdentity(
              onNoAuth: () => Navigator.pushNamedAndRemoveUntil(context,
                  RoutesConstant.welcome, (Route<dynamic> route) => false)),
          builder: (context, AsyncSnapshot<FirebaseUser> data) {
            if (!data.hasData) {
              return CircularProgressIndicator();
            }
            return ComponentChatBuilder(discussionId);
          },
        ),
      ),
    );
  }
}
