import 'package:flutter/material.dart';
import 'package:highvibe/modules/meditation/past_meditation.dart';
import 'package:highvibe/modules/meditation/your_presets.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_fab.dart';
import 'package:highvibe/widgets/outline_tab_indicator.dart';

class MeditationTimer extends StatefulWidget {
  @override
  _MeditationTimerState createState() => _MeditationTimerState();
}

class _MeditationTimerState extends State<MeditationTimer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _tabs = ['Your Presets', 'Past Meditations'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation Timer'),
        bottom: TabBar(
          controller: _tabController,
          indicatorPadding: const EdgeInsets.only(left: 10.0),
          indicator: const OutlineTabIndicator(
            gradient: primaryGradient,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _tabs.map((title) {
            return Container(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    title,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          YourPresets(),
          PastMeditations(),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('Add meditation Timer');
        },
      ),
    );
  }
}

// ignore: unused_element
class _Painter extends CustomPainter {
  final Gradient gradient;
  final Radius radius;
  final double strokeWidth;

  _Painter(this.gradient, this.radius, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2,
        size.width - strokeWidth, size.height - strokeWidth);
    final rRect = RRect.fromRectAndRadius(rect, radius ?? Radius.zero);
    final _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);
    canvas.drawRRect(rRect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class Corners {
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  const Corners({
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
  })  : assert(topLeft != null),
        assert(topRight != null),
        assert(bottomLeft != null),
        assert(bottomRight != null);
}
