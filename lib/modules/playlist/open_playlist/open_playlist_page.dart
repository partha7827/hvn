import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'open_playlist_controller.dart';

class OpenPlaylistPage extends StatefulWidget {
  const OpenPlaylistPage();

  @override
  _OpenPlaylistPageState createState() => _OpenPlaylistPageState();
}

class _OpenPlaylistPageState
    extends ModularState<OpenPlaylistPage, OpenPlaylistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}