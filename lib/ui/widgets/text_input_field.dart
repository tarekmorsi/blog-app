import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final Function onChanged;
  final Function validator;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        initialValue: initialValue,
        onChanged: onChanged,
        obscureText: obscure,
        validator: validator,
      ),
    );
  }

  TextInputField(
      {this.initialValue,
      this.onChanged,
      this.labelText,
      this.obscure = false,
      this.validator});
}
