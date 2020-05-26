import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final double size;

  const CustomFloatingActionButton({
    this.child,
    this.onPressed,
    this.size = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
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
