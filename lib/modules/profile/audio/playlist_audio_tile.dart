import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:lottie/lottie.dart';

class PlayListAudioTile extends StatelessWidget {
  const PlayListAudioTile({
    Key key,
    @required this.audio,
    this.isPlaying = false,
  }) : super(key: key);

  final Audio audio;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    audio.artworkUrlPath,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(audio.userName, style: normal12Hint),
                  Text(audio.title, style: bold18White),
                  Text(
                      mediaTimeFormatter(
                        Duration(
                          milliseconds: audio.duration,
                        ),
                      ),
                      style: normal12Hint),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isPlaying,
            child: SizedBox(
              height: 24,
              width: 24,
              child: Lottie.asset(
                'assets/animation/audio_play.json',
              ),
            ),
          ),
          IconButton(
            icon: PlaylistImageAssets.more,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
