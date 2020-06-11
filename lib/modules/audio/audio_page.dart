import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/profile/audio/audio_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

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
    return WillPopScope(
      onWillPop: onWillPop,
      child: Observer(
        builder: (_) {
          switch (controller.audios.status) {
            case FutureStatus.fulfilled:
              return ListView(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 80, right: 8),
                children: [
                  const HeaderRow(title: Strings.uploads),
                  for (final audioItem in controller.audios.value)
                    AudioTile(
                      audioFile: audioItem,
                      onTap: (item) =>
                          MediaOverlays.presentAudioPlayerAsOverlay(
                        context: context,
                        audioFile: item,
                      ),
                    ),
                ],
              );
            case FutureStatus.rejected:
              return const Text('Failed');
            default:
              return const SplashWidget();
          }
        },
      ),
    );
  }
}
