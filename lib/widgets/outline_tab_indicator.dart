import 'package:flutter/material.dart';

class OutlineTabIndicator extends Decoration {
  final double strokeWidth;
  final Radius radius;
  final LinearGradient gradient;

  const OutlineTabIndicator({
    this.strokeWidth = 2,
    this.radius = const Radius.circular(50.0),
    @required this.gradient,
  });

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _OutlinePainter(this, onChanged);
  }
}

class _OutlinePainter extends BoxPainter {
  _OutlinePainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final OutlineTabIndicator decoration;

  double get strokeWidth => decoration.strokeWidth;
  Radius get radius => decoration.radius;
  LinearGradient get gradient => decoration.gradient;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    var size = configuration.size;
    final Rect rect = Rect.fromLTWH(
      offset.dx,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );
    final RRect rRect = RRect.fromRectAndRadius(rect, radius ?? Radius.zero);
    final Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);
    canvas.drawRRect(rRect, _paint);
  }
}
