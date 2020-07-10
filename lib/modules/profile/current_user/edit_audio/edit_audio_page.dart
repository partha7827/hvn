import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'edit_audio_controller.dart';

class EditAudioPage extends StatefulWidget {
  const EditAudioPage();

  @override
  _EditAudioPageState createState() => _EditAudioPageState();
}

class _EditAudioPageState
    extends ModularState<EditAudioPage, EditAudioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}