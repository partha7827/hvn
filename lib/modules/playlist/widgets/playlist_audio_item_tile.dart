import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';

class PlaylistAudioItemTile extends StatelessWidget {
  final Audio audioFile;
  final ValueChanged<Audio> onDelete;

  const PlaylistAudioItemTile({
    @required this.audioFile,
    @required this.onDelete,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: PlaylistImageAssets.reorderAudioItemInPlaylist,
            onPressed: () => _reorderAudiofilesInPlayList(),
          ),
          const SizedBox(width: 10),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: audioFile.artworkUrlPath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${audioFile.title}', style: normaBoldl16White),
                  const SizedBox(height: 8),
                  Text(
                      mediaTimeFormatter(
                        Duration(
                          milliseconds: audioFile.duration,
                        ),
                      ),
                      style: normal14Hint),
                ],
              ),
            ),
          ),
          IconButton(
            icon: PlaylistImageAssets.closePlaylistAudioTile,
            onPressed: () => onDelete(audioFile),
          )
        ],
      ),
    );
  }

  void _reorderAudiofilesInPlayList() {
    print('_reorderAudiofilesInPlayList');
  }
}
