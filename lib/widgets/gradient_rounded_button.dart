import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class GradientRoundedRaisedButton extends StatelessWidget {
  const GradientRoundedRaisedButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      padding: const EdgeInsets.all(0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: primaryGradient,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            '$label',
            style: normal16White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
