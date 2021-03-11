import 'package:flutter/material.dart';

class ComponentAppBar {
  final String titleAppBar;

  ComponentAppBar({@required this.titleAppBar});

  PreferredSizeWidget build() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(
        "The Chaaat  $titleAppBar", // automatic title from AppBarComponent
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
