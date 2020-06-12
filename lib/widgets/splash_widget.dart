import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)
      ..value = 0
      ..duration = const Duration(
        seconds: 1,
      );

    final start = 0.0;
    final stop = 1.0;
    _controller.repeat(
      min: start,
      max: stop,
      reverse: true,
      period: _controller.duration,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Lottie.asset(
          'assets/animation/splash_animation.json',
          controller: _controller,
          onLoaded: (composition) {
            setState(() {
              print('animation');
              _controller.duration = composition.duration;
            });
          },
        ),
      ),
    );
  }
}
