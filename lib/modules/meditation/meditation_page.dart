import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'focus/screens/breathe_screen.dart';
import 'meditation_controller.dart';

class MeditationPage extends StatefulWidget {
  final String title;
  const MeditationPage({Key key, this.title = 'Meditation'}) : super(key: key);

  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState
    extends ModularState<MeditationPage, MeditationController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return BreatheScreen();
  }
}
