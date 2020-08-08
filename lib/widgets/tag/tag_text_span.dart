import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TagTextSpan extends TextSpan {
  TagTextSpan({
    TextStyle style,
    VoidCallback onPressed,
    String text,
  }) : super(
          style: style,
          text: text,
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        );
}
