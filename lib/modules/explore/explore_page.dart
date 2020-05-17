import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'explore_controller.dart';

class ExplorePage extends StatefulWidget {
  final String title;
  const ExplorePage({Key key, this.title = "Explore"}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends ModularState<ExplorePage, ExploreController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("Endless feed of creators..."),
        ],
      ),
    );
  }
}
