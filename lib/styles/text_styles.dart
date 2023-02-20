import 'package:flutter/material.dart';

class LabelTextStyle {
  static TextStyle? bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
          color: Colors.black,
          letterSpacing: 2.0,
        );
  }
}
