import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:highvibe/widgets/load_widget.dart';
import 'package:mobx/mobx.dart';

import 'show_audio_controller.dart';

class ShowAudioPage extends StatefulWidget {
  @override
  _ShowAudioPageState createState() => _ShowAudioPageState();
}

class _ShowAudioPageState
    extends ModularState<ShowAudioPage, ShowAudioController> {
  ReactionDisposer disposeReaction;

  @override
  void initState() {
    super.initState();
    controller.loadAudios();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: LoadWidget(
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
      ),
    );
  }

  Widget buildAudios(List<Audio> audios) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const HeaderRow(title: Strings.uploads),
            const IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: ProfileModule.toUploadAudio,
            )
          ],
        ),
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
          ],
        ),
        const SizedBox(height: 10),
        // for (final item in tempInMemoryPlaylistCollection) ...[
        //   GestureDetector(
        //     onTap: () async {
        //       MediaOverlays.presentPlayListPlayerAsOverlay(
        //         context: context,
        //         playList: item,
        //       );
        //     },
        //     child: PlaylistTile(
        //       isInEditMode: false,
        //       playList: item,
        //       onTap: (item) => playlistContextMenu(context, item),
        //     ),
        //   )
        // ],
      ],
    );
  }
}