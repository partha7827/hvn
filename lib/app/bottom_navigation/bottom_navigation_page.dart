import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'bottom_navigation_controller.dart';

class BottomNavigationPage extends StatefulWidget {
  final String title;
  const BottomNavigationPage({Key key, this.title = "BottomNavigation"})
      : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState
    extends ModularState<BottomNavigationPage, BottomNavigationController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
