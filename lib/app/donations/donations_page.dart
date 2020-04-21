import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'donations_controller.dart';

class DonationsPage extends StatefulWidget {
  final String title;
  const DonationsPage({Key key, this.title = "Donations"}) : super(key: key);

  @override
  _DonationsPageState createState() => _DonationsPageState();
}

class _DonationsPageState
    extends ModularState<DonationsPage, DonationsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("Probably overlay over any screen with donate button..."),
        ],
      ),
    );
  }
}
