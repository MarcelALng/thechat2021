import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/screens/components/textformfield_component.dart';

import 'components/appbar_component.dart';
import 'components/textformfield_component.dart';

class SigninScreen extends StatelessWidget {
  //const SigninScreen({Key key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComponentAppBar(
          titleAppBar: "The Chat : se connecter",
        ).build(),
        backgroundColor: Color(GlobalConstant.colorBackground),
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
                      child: Image.asset(GlobalConstant.assetLogo),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsets.symmetric(
                  //       horizontal: 20.0,
                  //       vertical: 10.0,
                  //     ),
                  //     hintText: "Adresse Email",
                  //     hintStyle: TextStyle(color: Colors.white38),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(32.0),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           width: 1.0, color: Colors.lightBlueAccent),
                  //       borderRadius: BorderRadius.circular(32.0),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         width: 2.0,
                  //         color: Colors.blueAccent,
                  //       ),
                  //       borderRadius: BorderRadius.circular(32.0),
                  //     ),
                  //   ),
                  // ),
                  ComponentTextFormField(
                    hintText: "Adresse Email",
                    onSaved: (value) {},
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  ComponentTextFormField(
                    hintText: "Mot de passe",
                    onSaved: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
