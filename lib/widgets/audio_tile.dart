import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/values/themes.dart';

class AudioTile extends StatelessWidget {
  final Audio audioFile;
  final ValueChanged<Audio> onItemTapped;

  const AudioTile({
    @required this.audioFile,
    @required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: "audio#${audioFile.id}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: audioFile.artworkUrlPath,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    audioFile.title,
                    style: normal16White,
                  ),
                  Text(
                    audioFile.subTitle,
                    style: normal14Hint,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/ic_play.svg'),
            onPressed: () => onItemTapped(audioFile),
          )
        ],
      ),
    );
  }
}
