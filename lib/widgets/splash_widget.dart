import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: const SpinKitFoldingCube(color: Colors.white),
      ),
    );
  }
}
