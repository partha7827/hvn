import 'package:flutter/material.dart';

// Create a transition that fades in the new view,
// while fading out a white background
class WhitePageRoute extends PageRouteBuilder {
  final Widget enterPage;

  WhitePageRoute({this.enterPage})
      : super(
            transitionDuration: const Duration(milliseconds: 1700),
            pageBuilder: (context, animation, secondaryAnimation) => enterPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final fadeIn = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                    curve: const Interval(.7, 1), parent: animation),
              );
              final fadeOut = Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                    curve: const Interval(0, .2), parent: animation),
              );
              return Stack(
                children: <Widget>[
                  FadeTransition(
                    opacity: fadeOut,
                    child: Container(color: Colors.white),
                  ),
                  FadeTransition(opacity: fadeIn, child: child)
                ],
              );
            });
}
