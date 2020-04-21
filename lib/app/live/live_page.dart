import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'live_controller.dart';

class LivePage extends StatefulWidget {
  final String title;
  const LivePage({Key key, this.title = "Live"}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends ModularState<LivePage, LiveController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("Video Streaming"),
          Text("Separator"),
          Text("Thread Chat"),
        ],
      ),
    );
  }
}
