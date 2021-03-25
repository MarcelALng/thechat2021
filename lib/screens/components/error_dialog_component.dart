import 'package:flutter/material.dart';

class ComponentErrorDialog extends StatelessWidget {
  final String errorCode;
  ComponentErrorDialog(this.errorCode);
  @override
  Widget build(BuildContext context) {
    String _message = "";
    switch (errorCode) {
      case "ERROR_WRONG_PASSWORD":
      case "ERROR_USER_NOT_FOUND":
        _message = "Les identifiants sont incorrects, merci de reessayer";
        break;
      default:
        _message =
            "Une erreur inattendue est survenue, merci de réessayer dans quelques minutes";
        break;
    }
    return SimpleDialog(
      title: Text(
        "Erreur!!!",
        style: TextStyle(color: Colors.red),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_message),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Fermer"),
        )
      ],
    );
  }
}
