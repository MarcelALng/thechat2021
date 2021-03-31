import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

import 'package:thechat2021/controllers/chat_controller.dart';

class ComponentChatBuilder extends StatelessWidget {
  final String discussionId;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  ComponentChatBuilder(this.discussionId);

  @override
  Widget build(BuildContext context) {
    final ChatController _controller = Provider.of<ChatController>(context);
    String _message;
    return StreamBuilder<QuerySnapshot>(
        stream: _controller.getChat(discussionId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Text(" Pas de données pour cette discussion."),
            );
          }
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, item) {
                      final DateTime _dateString = DateTime.tryParse(
                          snapshot.data.documents[item]["date"]);
                      final String _dateFormated = _dateString != null
                          ? formatDate(_dateString,
                              [dd, '-', mm, '-', yy, ' ', HH, ':', mm, ':', ss])
                          : "Erreur";
                      final String _displayName = snapshot
                          .data.documents[item]["sender"]
                          .toString()
                          .split("@")[0]
                          .toUpperCase();
                      bool isMe = snapshot.data.documents[item]["sender"] ==
                              _controller.activeUser.email
                          ? true
                          : false;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  _displayName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  _dateFormated,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            Container(
                              color:
                                  isMe ? Colors.lightBlueAccent : Colors.grey,
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                  snapshot.data.documents[item]["content"]),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Form(
                key: _keyForm,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          onSaved: (value) {
                            _message = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "le champs est vide";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Veuillez écrire votre message:",
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "Envoyer",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_keyForm.currentState.validate()) {
                            _keyForm.currentState.save();
                            _keyForm.currentState
                                .reset(); // efface le message du champs decriture
                            print(_message); //test pour verifier
                            _controller.sendPostChat(
                                postChat: _message, discussionId: discussionId);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}