import 'package:flutter/widgets.dart';
import 'package:highvibe/widgets/animated_widgets/delay_tween.dart';

class SpinningCircleLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  const SpinningCircleLoadingIndicator({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  @override
  _SpinningCircleLoadingIndicatorState createState() =>
      _SpinningCircleLoadingIndicatorState();
}

class _SpinningCircleLoadingIndicatorState
    extends State<SpinningCircleLoadingIndicator>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [
    .0,
    -1.1,
    -1.0,
    -0.9,
    -0.8,
    -0.7,
    -0.6,
    -0.5,
    -0.4,
    -0.3,
    -0.2,
    -0.1
  ];

  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(
            12,
            (item) {
              final _position = widget.size * .5;
              return Positioned.fill(
                left: _position,
                top: _position,
                child: Transform(
                  transform: Matrix4.rotationZ(30.0 * item * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: FadeTransition(
                      opacity: DelayTween(
                        begin: 0.0,
                        end: 1.0,
                        delay: delays[item],
                      ).animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(item),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        );
}
