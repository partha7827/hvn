import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          duration: Duration(milliseconds: 1200),
        ),
      ),
    );
  }
}
