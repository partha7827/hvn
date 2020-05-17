import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  final String title;
  final String userId;
  const LivePage({Key key, this.userId, this.title = "Live"}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
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
