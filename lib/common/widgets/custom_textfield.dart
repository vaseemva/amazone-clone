import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextfield(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        hintText: hintText,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
