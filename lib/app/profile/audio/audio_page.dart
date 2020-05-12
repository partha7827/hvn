import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/playlists_card.dart';

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
  User get user => controller.user;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: <Widget>[
        HeaderRow(
          title: Strings.uploads,
        ),
        controller.readyFiles
            ? (controller.audioFiles
                .map(
                  (item) => AudioTile(
                    audioFile: item,
                    onItemTapped: (item) => _showAudioPlayer(context, item),
                  ),
                )
                .toList())
            : CircularProgressIndicator(),
        HeaderRow(
          title: Strings.playlists,
          showTrailing: true,
          onPressedTrailing: () {},
        ),
        PlaylistsCard(
          title: 'Pure Positive Vibes',
          playlistLength: 4,
        ),
      ],
    );
  }

  void _showAudioPlayer(BuildContext context, AudioFile audioFile) {
    Modular.to.pushNamed("/audioplayer", arguments: audioFile);
  }
}
