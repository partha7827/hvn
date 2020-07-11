import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class PageIndicator extends AnimatedWidget {
  final int count;
  final PageController controller;
  final double indicatorWidth;
  final double indicatorHeight;
  final double radius;

  const PageIndicator({
    @required this.controller,
    @required this.count,
    this.indicatorWidth = 12,
    this.indicatorHeight = 4,
    this.radius = 10,
    Key key,
  })  : assert(controller != null),
        assert(count != null),
        super(listenable: controller, key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size((count + count - 1) * indicatorWidth, 4),
      painter: IndicatorPainter(
        controller: controller,
        count: count,
        indicatorWidth: indicatorWidth,
        indicatorHeight: indicatorHeight,
        radius: radius,
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  final int count;
  final PageController controller;
  final double indicatorWidth;
  final double indicatorHeight;
  final double radius;

  IndicatorPainter({
    this.controller,
    this.count,
    this.indicatorWidth,
    this.indicatorHeight,
    this.radius,
  });

  final _paint = Paint()
    ..color = hintTextColor
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  final _indicatorPaint = Paint()
    ..color = accentColor
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    var distance = 0.0;
    for (var i = 0; i < count; i++) {
      canvas.drawRRect(
        RRect.fromLTRBR(
          distance,
          0,
          distance + indicatorWidth,
          indicatorHeight,
          Radius.circular(radius),
        ),
        _paint,
      );
      distance = distance + indicatorWidth * 2;
    }

    final dx = controller.page * indicatorWidth * 2;
    canvas.drawRRect(
      RRect.fromLTRBR(
        dx,
        0,
        dx + indicatorWidth,
        indicatorHeight,
        Radius.circular(radius),
      ),
      _indicatorPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
