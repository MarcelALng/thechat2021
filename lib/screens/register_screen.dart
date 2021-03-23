import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:thechat2021/constants/global_constant.dart';
import 'package:thechat2021/screens/components/button_component.dart';
import 'package:thechat2021/screens/components/textformfield_component.dart';
import 'package:thechat2021/constants/routes_constant.dart';

import 'components/appbar_component.dart';
import 'components/textformfield_component.dart';

// import 'package:faker/faker.dart'; // to test random email

class RegisterScreen extends StatelessWidget {
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _email = "";
    String _password = "";

    return Scaffold(
        appBar: ComponentAppBar(
          titleAppBar: " : s'inscrire",
        ).build(),
        // backgroundColor: Color(GlobalConstant.colorBackground), no need cos theme data in main dart
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
                    flex: 6,
                    child: Hero(
                      tag: "logoTag",
                      child: Image.asset(GlobalConstant.assetLogo),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Flexible(
                    child: ComponentTextFormField(
                      validator: (email) {
                        if (!EmailValidator.validate(email)) {
                          return "Merci d'entre une adresse email correct.";
                        }
                        return null;
                      },
                      hintText: "Adresse Email",
                      onSaved: (value) {
                        _email = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Flexible(
                    child: ComponentTextFormField(
                      controller: _passController,
                      validator: (mdp) {
                        if (mdp.length < 6) {
                          return "Le mot de passe doit contenir au minimim 6 caractères";
                        } else if (!mdp.contains("@")) {
                          return "le mot de passe doit contenir un @";
                        }
                        return null;
                      },
                      hintText: "Mot de passe",
                      onSaved: (value) {
                        _password = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Flexible(
                    child: ComponentTextFormField(
                      validator: (confirmMdp) {
                        if (confirmMdp.isEmpty) {
                          return "Merci de confirmer votre mot de passe.";
                        } else if (confirmMdp != _passController.text) {
                          return "La confirmation du mot de passe n'est pas identique";
                        }
                        return null;
                      },
                      hintText: "Confirmer mot de passe",
                      onSaved: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Hero(
                    tag: "registerLogoTag",
                    child: ComponentButton(
                      buttonName: "S'inscrire",
                      onPressed: () async {
                        try {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState
                                .save(); // global key to  save data emailuser
                            final FirebaseUser user =
                                (await _firebase.createUserWithEmailAndPassword(
                                        email: _email,
                                        //faker.internet .email() fake email adresse random
                                        password: _password))
                                    .user;
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutesConstant.userHome,
                                (Route<dynamic> route) => false);
                            print(
                                _email + " créé"); // pour afficher le résultat
                          }
                        } catch (onError) {
                          print(Error);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
