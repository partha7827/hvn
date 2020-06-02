import 'package:flutter/material.dart';

class TransparentRoute extends PageRoute<dynamic> {
  final WidgetBuilder builder;
  final Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
  ) animationBuilder;
  final int duration;

  TransparentRoute({
    @required this.builder,
    this.animationBuilder,
    this.duration = 350,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: duration);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final childWidget = builder(context);
    if (animationBuilder == null) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: childWidget),
      );
    } else {
      return animationBuilder(
        context,
        animation,
        secondaryAnimation,
        childWidget,
      );
    }
  }
}
