import 'package:flutter/material.dart';

extension TextX on Text {
  static Text textX(String text) {
    return Text(text, style: const TextStyle(color: Colors.white));
  }
}