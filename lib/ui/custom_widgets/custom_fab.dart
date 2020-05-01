import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const CustomFloatingActionButton({
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          gradient: primaryGradient,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
