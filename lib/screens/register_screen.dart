import 'package:flutter/material.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/screens/components/button_component.dart';
import 'package:thechat2021/screens/components/textformfield_component.dart';

import 'components/appbar_component.dart';
import 'components/textformfield_component.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComponentAppBar(
          titleAppBar: " : s'inscrire",
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
                    child: Hero(
                      tag: "logoTag",
                      child: Image.asset(GlobalConstant.assetLogo),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  ComponentTextFormField(
                    hintText: "Adresse Email",
                    onSaved: (value) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ComponentTextFormField(
                    hintText: "Mot de passe",
                    onSaved: (value) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ComponentTextFormField(
                    hintText: "Confirmer mot de passe",
                    onSaved: (value) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Hero(
                    tag: "registerLogoTag",
                    child: ComponentButton(
                      buttonName: "S'enregistrer",
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
