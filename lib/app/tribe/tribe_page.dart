import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tribe_controller.dart';

class TribePage extends StatefulWidget {
  final String title;
  const TribePage({Key key, this.title = "Tribe"}) : super(key: key);

  @override
  _TribePageState createState() => _TribePageState();
}

class _TribePageState extends ModularState<TribePage, TribeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("Tribe Creator Profile Tab"),
          Text("Tribe Shared Materials Tab"),
          Text("Tribe Chat Tab"),
          Text("Tribe Live Streaming Tab"),
          Text("Button to Follow/Subscribe"),
          Text("Button to Donate"),
          Text("Creator Tab to share materials/start live broadcasting"),
        ],
      ),
    );
  }
}
