import 'package:flutter/material.dart';

class ComponentAppBar {
  //const AppBarComponent({Key key}) //: super(key: key);
  final String titleAppBar;

  ComponentAppBar({@required this.titleAppBar});

  PreferredSizeWidget build() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(
        titleAppBar, // automatic title from AppBarComponent
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
