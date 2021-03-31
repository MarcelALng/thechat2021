import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:thechat2021/controllers/chat_controller.dart';

class ComponentFloatingAction extends StatelessWidget {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ChatController _controller = Provider.of<ChatController>(context);
    String _discussionName;
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                  child: Form(
                key: _keyForm,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          onSaved: (value) {
                            _discussionName = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Le champs est vide";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Ajouter une discussion",
                          ),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "Ajouter",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () async {
                          if (_keyForm.currentState.validate()) {
                            _keyForm.currentState.save();
                            await _controller
                                .sendNewDiscussion(_discussionName);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ));
            });
      },
      child: Icon(Icons.add),
    );
  }
}
