import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Color(0xff4682B4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox(
                height: 48.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Se connecter",
                  style: TextStyle(fontSize: 34.0),
                ),
                color: Colors.blueAccent,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "S'inscrire",
                  style: TextStyle(fontSize: 34.0),
                ),
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
