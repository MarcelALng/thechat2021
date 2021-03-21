import 'package:flutter/material.dart';

import 'package:thechat2021/controllers/chat_controller.dart';

class ComponentAppBar {
  final String titleAppBar;

  ComponentAppBar({@required this.titleAppBar});

  PreferredSizeWidget build() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            size: 30.0,
            color: Colors.red,
          ),
          onPressed: () {
            ChatController().signOut();
          },
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(
        "The Chaaat  $titleAppBar", // automatic title from AppBarComponent
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
