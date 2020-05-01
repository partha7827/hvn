import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class GradientRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData icon;

  const GradientRaisedButton({
    this.onPressed,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 88, minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: primaryGradient,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
