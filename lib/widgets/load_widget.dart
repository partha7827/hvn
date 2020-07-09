import 'package:flutter/material.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

class LoadWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final ObservableFuture<Object> future;
  final Function builder;

  const LoadWidget({
    this.child,
    this.future,
    this.builder,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _LoadWidgetState createState() => _LoadWidgetState();
}

class _LoadWidgetState extends State<LoadWidget> {
  bool isAnimationComplete = false;
  bool isFutureComplete = false;
  double widgetOpacity = 0;

  void maybeShow() {
    if (isAnimationComplete && isFutureComplete) {
      setState(() {
        widgetOpacity = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.child != null) {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          isFutureComplete = true;
        });
        maybeShow();
      });
    } else {
      when((_) => widget.future.status == FutureStatus.fulfilled, () {
        setState(() {
          isFutureComplete = true;
        });
        maybeShow();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashWidget(
          duration: widget.duration,
          animationCompleteCallback: () {
            setState(() {
              isAnimationComplete = true;
            });
            maybeShow();
          },
        ),
        AnimatedOpacity(
          opacity: widgetOpacity,
          duration: widget.duration,
          child: widget.child ?? widget.builder(widget.future.value),
        ),
      ],
    );
  }
}
