
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/audio/audio_module.dart';
import 'package:highvibe/modules/profile/video/video_module.dart';

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
        RouterOutlet(
          module: VideoModule(userId),
        ),
      ],
    );
  }
}
