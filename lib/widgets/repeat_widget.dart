import 'package:flutter/material.dart';

class RepeatWidget extends StatelessWidget {
  final Function onPressed;

  const RepeatWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlineButton(
        borderSide: BorderSide(width: 5, color: Colors.white),
        onPressed: onPressed,
        child: Text("Try again"),
      ),
    );
  }
}
