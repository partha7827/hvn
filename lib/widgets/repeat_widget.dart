import 'package:flutter/material.dart';
import 'package:hvn/values/themes.dart';

class RepeatWidget extends StatelessWidget {
  final Function onPressed;

  const RepeatWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlineButton(
        borderSide: BorderSide(width: 5, color: Colors.white),
        onPressed: onPressed,
        child: Text("Try again", style: normal14White),
      ),
    );
  }
}
