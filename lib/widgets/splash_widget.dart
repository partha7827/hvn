import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({
    Key key,
    this.animationCompleteCallback,
  }) : super(key: key);

  final AnimationCompleteCallback animationCompleteCallback;

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
        seconds: 3,
      );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if(widget.animationCompleteCallback != null) {
          widget.animationCompleteCallback();
        }
      }
    });
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
          onLoaded: (LottieComposition composition) {
            setState(() {
              _controller.duration = composition.duration;
            });
          },
        ),
      ),
    );
  }
}

typedef AnimationCompleteCallback = void Function();
