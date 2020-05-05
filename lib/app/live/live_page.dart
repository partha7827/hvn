import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'live_controller.dart';

class LivePage extends StatefulWidget {
  final String title;
  final String userId;
  const LivePage({Key key, this.userId, this.title = "Live"}) : super(key: key);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends ModularState<LivePage, LiveController> {
  @override
  void initState() {
    controller.init(widget.userId);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return AgoraRenderWidget(0, local: true, preview: true);
  }
}
