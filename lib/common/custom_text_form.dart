import 'package:flutter/material.dart';

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

  const CustomTextForm(
      {Key key,
      this.hint,
      this.controller,
      this.isObscure = false,
      this.icon,
      this.validator,
      this.onSave,
      this.keyboardType,
      this.borderRadius,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        style: theme.textTheme.subtitle,
        controller: controller,
        obscureText: isObscure,
        validator: validator,
        keyboardType: keyboardType,
        maxLength: maxLength,
        onSaved: onSave,
        decoration: InputDecoration(
          filled: true,
          errorStyle: theme.textTheme.caption.copyWith(color: Colors.red),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 50),
              borderSide: BorderSide()),
          prefixIcon: icon == null ?null: Icon(icon),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          labelText: hint,
        ),
      ),
    );
  }
}
