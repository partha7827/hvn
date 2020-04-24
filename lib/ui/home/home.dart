import 'package:flutter/material.dart';
import 'package:highvibe/ui/home/tools_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
        children: <Widget>[
          ToolsWidget(),
        ],
      ),
    );
  }
}
