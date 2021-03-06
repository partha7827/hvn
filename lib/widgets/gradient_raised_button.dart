import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class GradientRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData icon;
  final bool isLoading;
  final double minHeight;
  final double radius;

  const GradientRaisedButton({
    this.onPressed,
    this.label,
    this.icon,
    this.isLoading = false,
    this.minHeight = 48,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 88, minHeight: minHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: primaryGradient,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(icon),
                ),
              if (isLoading)
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              else
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
