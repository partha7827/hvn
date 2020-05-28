import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

import 'audio_controller.dart';

class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends ModularState<AudioPage, AudioController> {
  @override
  void initState() {
    super.initState();
    controller.loadAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (controller.audios.status) {
          case FutureStatus.fulfilled:
            return buildAudios(controller.audios.value);
          case FutureStatus.rejected:
            return RepeatWidget(controller.loadAudios);
          default:
            return SplashWidget();
        }
      },
    );
  }

  Widget buildAudios(List<Audio> audios) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: [
        HeaderRow(title: Strings.uploads),
        ...audios
            .map(
              (item) => AudioTile(
                audioFile: item,
                onItemTapped: (_) => _showAudioPlayer(context, item),
              ),
            )
            .toList(),
      ],
    );
  }

  void _showAudioPlayer(BuildContext context, Audio audioFile) {
    Modular.to.pushNamed("/audioplayer", arguments: audioFile);
  }
}
