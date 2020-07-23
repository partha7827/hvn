import 'package:flutter/material.dart';

class PaperInput extends StatelessWidget {
  PaperInput({
    this.labelText,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.controller,
    this.maxLines,
    this.obscureText = false,
    this.filled = false,
    this.fillColor = Colors.transparent,
    this.style,
  });

  final ValueChanged<String> onChanged;
  final String errorText;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;
  final bool filled;
  final Color fillColor;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      style: style,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xff818181)),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xff818181)),
        errorText: errorText,
        filled: filled,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 5.0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
