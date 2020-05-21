import 'package:flutter/material.dart';

class TransparentRoute extends PageRoute {
  final WidgetBuilder builder;

  TransparentRoute({
    @required this.builder,
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
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final childWidget = builder(context);
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(scale: animation, child: childWidget),
    );
  }
}
