import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'timer_controller.dart';

class TimerPage extends StatefulWidget {
  final String title;
  const TimerPage({Key key, this.title = "Timer"}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends ModularState<TimerPage, TimerController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("Presets Tab"),
          Text("Meditation Tab"),
        ],
      ),
    );
  }
}
