import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/models/models.dart' show Video;
import 'package:highvibe/values/themes.dart';

class VideoTile extends StatelessWidget {
  final Video videoFile;
  final ValueChanged<Video> onItemTapped;

  const VideoTile({
    @required this.videoFile,
    @required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: "video#${videoFile.id}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: videoFile.snippet.videoThumbnail.url,
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
                    videoFile.snippet.title,
                    style: normal16White,
                  ),
                  Text(
                    videoFile.snippet.description,
                    style: normal14Hint,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/ic_play.svg'),
            onPressed: () => onItemTapped(videoFile),
          )
        ],
      ),
    );
  }
}
