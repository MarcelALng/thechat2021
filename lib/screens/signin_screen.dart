import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/constants/routes_constant.dart';

import 'package:thechat2021/screens/components/button_component.dart';
import 'package:thechat2021/screens/components/textformfield_component.dart';

import 'components/appbar_component.dart';
import 'components/textformfield_component.dart';

class SigninScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    return Scaffold(
        appBar: ComponentAppBar(
          titleAppBar: ": se connecter",
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
                        child: Image.asset(GlobalConstant.assetLogo)),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  ComponentTextFormField(
                    validator: (email) {
                      if (!EmailValidator.validate(email)) {
                        return "l'adresse email est invalide";
                      }
                      return null;
                    },
                    hintText: "Adresse Email",
                    onSaved: (emailSaved) {
                      _email = emailSaved;
                    },
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  ComponentTextFormField(
                    validator: (mdp) {
                      if (mdp.length < 6) {
                        return "Le mot de passe doit contenir au minimum 6 caracteres.";
                      } else if (!mdp.contains("@")) {
                        return "le mot de passe doit contenir un @.";
                      }
                      return null; // to check if connection ok or not;
                    },
                    hintText: "Mot de passe",
                    onSaved: (passwordSaved) {
                      _password = passwordSaved;
                    },
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Hero(
                    tag: "signinLogoTag",
                    child: ComponentButton(
                      buttonName: "Se connecter",
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                        try {
                          final FirebaseUser user =
                              (await _firebase.signInWithEmailAndPassword(
                                      email: _email, password: _password))
                                  .user;
                          Navigator.pushReplacementNamed(
                              context, RoutesConstant.userHome);
                          print(user);
                        } catch (error) {
                          print(error);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
