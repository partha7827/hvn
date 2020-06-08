import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/values/themes.dart';

class PlaylistAudioItemTile extends StatelessWidget {
  const PlaylistAudioItemTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://takelessons.com/blog/wp-content/uploads/2020/03/flute-for-beginners.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 70,
                height: 70,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mock Audio File', style: normaBoldl16White),
                  const SizedBox(height: 8),
                  Text('Duration', style: normal14Hint),
                ],
              ),
            ),
          ),
          IconButton(
            icon: PlaylistImageAssets.closePlaylistAudioTile,
            onPressed: () => _deleteAudioFileFromPlayList(),
          )
        ],
      ),
    );
  }

  void _deleteAudioFileFromPlayList() {
    print('_deleteAudioFileFromPlayList');
  }
}
