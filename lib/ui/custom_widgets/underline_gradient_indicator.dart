import 'package:flutter/material.dart';

class UnderlineGradientIndicator extends Decoration {
  final LinearGradient gradient;
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;

  const UnderlineGradientIndicator({
    this.borderSide = const BorderSide(width: 3.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.gradient,
  });

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final UnderlineGradientIndicator decoration;

  LinearGradient get gradient => decoration.gradient;
  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    Rect indicator =
        _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint()
      ..strokeCap = StrokeCap.square
      ..shader = gradient.createShader(indicator);
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
