import 'package:flutter/material.dart';

const kHeight10 = SizedBox(
  height: 10,
);

showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
