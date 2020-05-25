import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

import 'audio_controller.dart';

class AudioPage extends StatefulWidget {
  final String title;
  final User user;

  const AudioPage({
    Key key,
    this.title = "Audio",
    this.user,
  }) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends ModularState<AudioPage, AudioController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (controller.audios.status) {
          case FutureStatus.fulfilled:
            return ListView(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, bottom: 80, right: 8),
              children: [
                HeaderRow(title: Strings.uploads),
                ...controller.audios.value
                    .map(
                      (item) => AudioTile(
                        audioFile: item,
                        onItemTapped: (item) => _showAudioPlayer(context, item),
                      ),
                    )
                    .toList(),
              ],
            );

          case FutureStatus.rejected:
            return Text("failed");

          default:
            return SplashWidget();
        }
      },
    );
  }

  void _showAudioPlayer(BuildContext context, Audio audioFile) {
    Modular.to.pushNamed("/audioplayer", arguments: audioFile);
  }
}
