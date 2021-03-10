import 'package:flutter/material.dart';

class ComponentTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onSaved;

  ComponentTextFormField({
    @required this.hintText,
    @required this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.circular(32.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
