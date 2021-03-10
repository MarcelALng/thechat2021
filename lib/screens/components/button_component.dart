import 'package:flutter/material.dart';

class ComponentButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  ComponentButton({@required this.buttonName, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          // "Se connecter",
          style: TextStyle(fontSize: 34.0),
        ),
        color: Colors.blueAccent,
      ),
    );
  }
}
