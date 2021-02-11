import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  TextInput(
      {Key key,
      this.controller,
      this.textMessage,
      this.returnMessage,
      this.labelText,
      this.hintText})
      : super(key: key);
  final TextEditingController controller;
  final String textMessage;
  final String returnMessage;
  final String labelText;
  final String hintText;

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String _textValidator(String text) {
    if (text.isEmpty) {
      return widget.returnMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        validator: _textValidator,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            hintText: widget.hintText));
  }
}
