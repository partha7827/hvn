import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/models/audio_file/mock_audio_files.dart';
import 'package:highvibe/app/audio_player/models/models.dart';
// import 'package:highvibe/app/auth/user_store.dart';
import 'audio_controller.dart';

import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/playlists_card.dart';
import 'package:highvibe/values/Strings.dart';

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
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: <Widget>[
        HeaderRow(
          title: Strings.uploads,
        ),
        ...mockAudioItemsList
            .map(
              (item) => AudioTile(
                audioFile: item,
                onItemTapped: (item) => _showAudioPlayer(),
              ),
            )
            .toList(),
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

  void _showAudioPlayer() {
    print('showAudioPlayer');
  }
}
