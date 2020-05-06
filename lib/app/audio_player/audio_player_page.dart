import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'audio_player_controller.dart';

class AudioPlayerPage extends StatefulWidget {
  final String title;

  const AudioPlayerPage({
    Key key,
    this.title = "AudioPlayer",
  }) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState
    extends ModularState<AudioPlayerPage, AudioPlayerController> {
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
