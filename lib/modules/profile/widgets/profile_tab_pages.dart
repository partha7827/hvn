
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/audio/audio_module.dart';
import 'package:highvibe/modules/chat/chat_module.dart';
import 'package:highvibe/modules/live/live_module.dart';

class ProfileTabPages extends StatelessWidget {
  final TabController controller;
  final String userId;

  const ProfileTabPages({Key key, this.controller, this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: <Widget>[
        AudioModule(userId),
        ChatModule(userId),
        RouterOutlet(
          module: LiveModule(userId),
        ),
      ],
    );
  }
}
