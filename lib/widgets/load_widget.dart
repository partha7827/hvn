import 'package:flutter/material.dart';
import 'package:highvibe/widgets/splash_widget.dart';

class LoadWidget extends StatefulWidget {
  const LoadWidget({
    @required this.child,
  });

  final Widget child;
  @override
  _LoadWidgetState createState() => _LoadWidgetState();
}

class _LoadWidgetState extends State<LoadWidget> {
  bool isAnimationComplete = false;

  @override
  Widget build(BuildContext context) {
    return isAnimationComplete
        ? widget.child
        : SplashWidget(
            animationCompleteCallback: () {
              setState(() {
                isAnimationComplete = true;
              });
            },
          );
  }
}
