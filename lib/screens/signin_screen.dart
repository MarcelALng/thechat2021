import 'dart:ui';

import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  //const SigninScreen({Key key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            "The Chat: Se connecter",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      child: Image.asset("assets/logo.png"),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFormField(),
                  TextFormField(),
                ],
              ),
            ),
          ),
        ));
  }
}
