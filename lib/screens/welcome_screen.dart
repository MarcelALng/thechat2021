import 'package:flutter/material.dart';

import 'package:thechat2021/constants/routes_constant.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("The Chat 2021", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color(0xff4682B4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, RoutesConstant.signin),
                    child: Text(
                      "Se connecter",
                      style: TextStyle(fontSize: 34.0),
                    ),
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  onPressed: () {},
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(fontSize: 34.0),
                  ),
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
