import 'package:flutter/material.dart';

import 'package:thechat2021/constants/routes_constant.dart';
import 'package:thechat2021/constants/global_constant.dart';

import 'components/appbar_component.dart';
import 'components/button_component.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComponentAppBar(
        titleAppBar: "The Chat : Bienvenue",
      ).build(),
      backgroundColor: Color(GlobalConstant.colorBackground),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Image.asset(GlobalConstant.assetLogo),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              ComponentButton(
                buttonName: "Se connecter",
                onPressed: () => Navigator.pushNamed(
                  context,
                  RoutesConstant.signin,
                ),
              ),
              ComponentButton(
                buttonName: "S'inscrire",
                onPressed: () =>
                    Navigator.pushNamed(context, RoutesConstant.register),
              )
              // Flexible(
              //   child:
              // ),
              //  Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //     child: RaisedButton(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(60.0),
              //       ),
              //       onPressed: () {},
              //       child: Text(
              //         "S'inscrire",
              //         style: TextStyle(fontSize: 34.0),
              //       ),
              //       color: Colors.blueAccent,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
