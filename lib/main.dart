import 'dart:io';

import 'package:flutter/material.dart';

import 'constants/routes_constant.dart';
import 'screens/welcome_screen.dart';
import 'package:thechat2021/screens/signin_screen.dart';
import 'screens/register_screen.dart';

void main() => runApp(TheChatApp());

class TheChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Chat 2021",
      initialRoute: RoutesConstant.welcome,
      routes: {
        RoutesConstant.welcome: (context) => WelcomeScreen(),
        RoutesConstant.register: (context) => RegisterScreen(),
        RoutesConstant.signin: (context) => SigninScreen(),
        // RoutesConstant.userchat: (context) => UserChatScreen(),
        // RoutesConstant.usermain: (context) => UserMainScree(),
        // RoutesConstant.changePassword: (context) => ChangePassword(),
      },
    );
  }
}

/* Main.dart est chargé en 1er
il charge par défaut RoutesConstant.WelcomeScreen
qui charge donc WelcomeScreen.dart 
Ensuite on peut choisir de cliquer sur Signin en cliquan sur RoutesConstant.Signin 
ou bien Register en cliquant sur RoutesConstant.register 

*/
