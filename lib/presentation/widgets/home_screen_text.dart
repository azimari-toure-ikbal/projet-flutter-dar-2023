import 'package:flutter/material.dart';

Widget HomeScreenText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 42,
      decoration: TextDecoration.underline,
      decorationThickness: .3,
    ),
  );
}
