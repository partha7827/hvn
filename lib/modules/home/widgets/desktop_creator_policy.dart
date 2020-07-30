import 'package:flutter/material.dart';

class DesktopCreatorPolicy extends StatelessWidget {
  const DesktopCreatorPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          'Creator Policy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 72,
          ),
        ),
      ),
    );
  }
}
