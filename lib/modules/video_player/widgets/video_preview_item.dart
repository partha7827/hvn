import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Video;
import 'package:highvibe/utils/utils.dart' show screenWidth;
import 'package:highvibe/values/themes.dart';

class VideoPreviewItem extends StatelessWidget {
  final Video video;

  const VideoPreviewItem({
    @required this.video,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context) - 40;
    return Container(
      padding: EdgeInsets.all(4),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: video.snippet.videoThumbnail.url,
                      width: width,
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                    Container(
                      width: width,
                      height: 180,
                      color: Colors.black26,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(video.snippet.title, style: normal16White),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
