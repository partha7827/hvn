import 'package:flutter/material.dart';
import 'package:highvibe/ui/custom_widgets/audio_tile.dart';
import 'package:highvibe/ui/custom_widgets/header_row.dart';
import 'package:highvibe/ui/custom_widgets/playlists_card.dart';
import 'package:highvibe/values/Strings.dart';

var dummyImgUrl =
    'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg';

class CreatorAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: <Widget>[
        HeaderRow(
          title: Strings.uploads,
        ),
        AudioTile(
          title: 'Relaxing Flute',
          subTitle: 'Lorem ipsum dolar sit a mat',
          imageUrl: dummyImgUrl,
        ),
        AudioTile(
          title: 'Deep sleep',
          subTitle: 'Lorem ipsum dolar sit a mat',
          imageUrl: dummyImgUrl,
        ),
        AudioTile(
          title: 'Feel your soul',
          subTitle: 'Lorem ipsum dolar sit a mat',
          imageUrl: dummyImgUrl,
        ),
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
}