import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/models.dart';
import 'package:hvn/modules/app/media_overlays.dart';
import 'package:hvn/values/Strings.dart';
import 'package:hvn/widgets/audio_tile.dart';
import 'package:hvn/widgets/header_row.dart';
import 'package:hvn/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

import 'audio_controller.dart';

class AudioPage extends StatefulWidget {
  final String title;
  final User user;

  const AudioPage({
    Key key,
    this.title = 'Audio',
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
                for (final audioItem in controller.audios.value)
                  AudioTile(
                    audioFile: audioItem,
                    onTap: (item) => MediaOverlays.presentAudioPlayerAsOverlay(
                      context: context,
                      audioFile: item,
                    ),
                  ),
              ],
            );
          case FutureStatus.rejected:
            return Text('Failed');
          default:
            return SplashWidget();
        }
      },
    );
  }
}
