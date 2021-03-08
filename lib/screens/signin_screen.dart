import 'package:flutter/material.dart';

import 'package:thechat2021/constants/global_constant.dart';

import 'components/appbar_component.dart';

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
                  TextFormField(),
                  TextFormField(),
                ],
              ),
            ),
          ),
        ));
  }
}
