import 'package:flutter/material.dart';
import 'package:thechat2021/constants/global_constant.dart';

import 'screens/welcome_screen.dart';
import 'package:thechat2021/screens/signin_screen.dart';
import 'screens/register_screen.dart';
import 'screens/user_home_screen.dart';
import 'screens/user_chat_screen.dart';

import 'constants/routes_constant.dart';

void main() => runApp(TheChatApp());

class TheChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Chat 2021",
      initialRoute: RoutesConstant.welcome,
      onGenerateRoute: (route) {
        switch (route.name) {
          case RoutesConstant.userChat:
            return MaterialPageRoute(
                builder: (context) =>
                    UserChatScreen(discussionID: route.arguments));
            break;
          default:
            return MaterialPageRoute(builder: (context) => UserHomeScreen());
            break;
        }
      },
      routes: {
        RoutesConstant.welcome: (context) => WelcomeScreen(),
        RoutesConstant.register: (context) => RegisterScreen(),
        RoutesConstant.signin: (context) => SigninScreen(),
        RoutesConstant.userHome: (context) => UserHomeScreen(),
        // RoutesConstant.changePassword: (context) => ChangePassword(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0.0),
        scaffoldBackgroundColor: Color(GlobalConstant.colorBackground),
      ),
    );
  }
}

/* Main.dart est chargé en 1er
il charge par défaut RoutesConstant.WelcomeScreen
qui charge donc WelcomeScreen.dart 
Ensuite on peut choisir de cliquer sur Signin en cliquant sur RoutesConstant.Signin 
ou bien Register en cliquant sur RoutesConstant.register 
Tout semble se passer entre  main.dart Welcomescreen.dart et
*/
