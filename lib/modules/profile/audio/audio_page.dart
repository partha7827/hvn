import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
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
    return WillPopScope(
      onWillPop: onWillPop,
      child: Observer(
        builder: (_) {
          switch (controller.audios.status) {
            case FutureStatus.fulfilled:
              return buildAudios(controller.audios.value);
            case FutureStatus.rejected:
              return RepeatWidget(controller.loadAudios);
            default:
              return const SplashWidget();
          }
        },
      ),
    );
  }

  Widget buildAudios(List<Audio> audios) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: [
        const HeaderRow(title: Strings.uploads),
        for (final item in audios) ...[
          AudioTile(
            audioFile: item,
            onTap: (_) => MediaOverlays.presentAudioPlayerAsOverlay(
              context: context,
              audioFile: item,
            ),
          ),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderRow(title: PlaylistStrings.playlist),
            GestureDetector(
              onTap: () => PlaylistModule.toCreateNewPlaylist(),
              child: SizedBox(
                height: 20,
                width: 120,
                child: PlaylistImageAssets.newPlaylist,
              ),
            )
          ],
        ),
      ],
    );
  }
}
