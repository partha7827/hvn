import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/utils/utils.dart' show screenWidth;
import 'package:highvibe/values/themes.dart';

class AudioPreviewItem extends StatelessWidget {
  final Audio audio;
  final ValueChanged<Audio> onTap;

  const AudioPreviewItem({
    @required this.audio,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context) - 40;
    return GestureDetector(
      key: UniqueKey(),
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(audio),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'audio#${audio.id}',
                        child: CachedNetworkImage(
                          imageUrl: audio.artworkUrlPath,
                          width: width,
                          fit: BoxFit.cover,
                          height: 180,
                        ),
                      ),
                      Container(
                        width: width,
                        height: 180,
                        color: Colors.black26,
                        child: const Center(
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
                  child: Text(audio.title, style: normal16White),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
