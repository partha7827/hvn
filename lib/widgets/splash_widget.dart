import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Lottie.asset(
          'assets/animation/splash_animation.json',
        ),
      ),
    );
  }
}
