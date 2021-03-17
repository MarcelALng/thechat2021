import 'dart:ui';

import 'package:flutter/material.dart';

class ComponentTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onSaved;
  final void Function(String) validator;
  final TextEditingController controller;

  ComponentTextFormField({
    @required this.hintText,
    @required this.onSaved,
    this.validator,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? null,
      validator: validator ?? null,
      onSaved: onSaved,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.5, color: Colors.redAccent[700]),
            borderRadius: BorderRadius.circular(32.0)),
        errorStyle: TextStyle(color: Colors.red[700]),
        errorMaxLines: 2,
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
