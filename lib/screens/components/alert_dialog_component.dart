import 'package:flutter/material.dart';

import 'package:thechat2021/controllers/chat_controller.dart';
import 'package:provider/provider.dart';

class ComponentAlertDialog extends StatelessWidget {
  final String discussionId;
  ComponentAlertDialog(this.discussionId);

  @override
  Widget build(BuildContext context) {
    print(discussionId);
    return SimpleDialog(
      title: Text(
        "Supprimer la discussion",
        textAlign: TextAlign.center,
      ),
      titlePadding: EdgeInsets.all(8.0),
      children: <Widget>[
        Text(
          "Voulez-vous supprimer la discussion?",
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                child: Text("non"), onPressed: () => Navigator.pop(context)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text("oui"),
              onPressed: () async {
                await Provider.of<ChatController>(context, listen: false)
                    .deleteDiscussion(discussionId);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
