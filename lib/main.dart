import 'package:flutter/material.dart';

import 'constants/routes_constant.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(TheChatApp());

class TheChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Chat 2021",
      initialRoute: RoutesConstant.welcome,
      routes: {
        RoutesConstant.welcome: (context) => WelcomeScreen(),
        // RoutesConstant.register: (context) => RegisterScreen(),
        // RoutesConstant.signing: (context) => SigninScreen(),
        // RoutesConstant.userchat: (context) => UserChatScreen(),
        // RoutesConstant.usermain: (context) => UserMainScree(),
        // RoutesConstant.changePassword: (context) => ChangePassword(),
      },
    );
  }
}
