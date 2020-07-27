import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatelessWidget {
  CopyButton({this.text, this.value});
  final Text text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: text,
      onPressed: () {
        Clipboard.setData(ClipboardData(text: value));

        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text('Copied'),
        ));
      },
    );
  }
}