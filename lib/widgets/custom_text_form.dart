import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscure;
  final IconData icon;
  final String Function(String) validator;
  final String Function(String) onSave;
  final TextInputType keyboardType;
  final double borderRadius;
  final int maxLength;

  const CustomTextForm({
    Key key,
    this.hint,
    this.controller,
    this.isObscure = false,
    this.icon,
    this.validator,
    this.onSave,
    this.keyboardType,
    this.borderRadius,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextFormField(
        style: normal16White,
        controller: controller,
        obscureText: isObscure,
        validator: validator,
        keyboardType: keyboardType,
        maxLength: maxLength,
        onSaved: onSave,
        decoration: InputDecoration(
          filled: true,
          counterStyle: normal12White,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintStyle: normal16Hint,
          hintText: hint,
        ),
      ),
    );
  }
}
