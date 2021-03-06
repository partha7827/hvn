import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/mocks/mock_audio_files.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/audio_tile.dart';

const _dummyImgUrl =
    'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg';

class PlaylistsCard extends StatelessWidget {
  final String title;
  final int playlistLength;

  const PlaylistsCard({
    @required this.title,
    @required this.playlistLength,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: _dummyImgUrl,
              height: 140,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          ExpansionTile(
            backgroundColor: secondaryColor,
            title: Text(
              title,
              style: normal16White,
            ),
            subtitle: Text(
              '$playlistLength ${Strings.meditations}',
              style: normal14Hint,
            ),
            trailing: const Icon(Icons.playlist_play, color: Colors.white),
            children: <Widget>[
              for (final audioItem in mockAudioItemsList)
                AudioTile(
                  audioFile: audioItem,
                  onTap: (item) {
                    MediaOverlays.presentAudioPlayerAsOverlay(
                      context: context,
                      audioFile: item,
                    );
                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
