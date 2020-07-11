import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dev_controller.dart';

class DevPage extends StatefulWidget {
  const DevPage();

  @override
  _DevPageState createState() => _DevPageState();
}

class _DevPageState
    extends ModularState<DevPage, DevController> {

@override
  void initState() {
    // TODO: implement initState
    controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}