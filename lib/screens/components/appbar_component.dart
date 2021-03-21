import 'package:flutter/material.dart';

class ComponentAppBar {
  final String titleAppBar;
  final List<Widget> actions;

  ComponentAppBar({@required this.titleAppBar, this.actions});

  PreferredSizeWidget build() {
    return AppBar(
      actions: actions ?? null,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(
        "The Chaaat  $titleAppBar", // automatic title from AppBarComponent
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
