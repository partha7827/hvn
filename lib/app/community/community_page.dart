import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'community_controller.dart';

class CommunityPage extends StatefulWidget {
  final String title;
  const CommunityPage({Key key, this.title = "Community"}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState
    extends ModularState<CommunityPage, CommunityController> {
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
