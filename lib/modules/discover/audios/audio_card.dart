import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/models/models.dart' show Audio;
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/values/themes.dart';

class AudioCard extends StatelessWidget {
  final Audio audio;
  final Function onPlayTap;

  AudioCard(this.audio, {this.onPlayTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _playWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 90,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _headerWidget(),
                        _authorWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell _playWidget() {
    return InkWell(
      onTap: onPlayTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 80,
              height: 90,
              imageUrl: audio.artworkUrlPath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                Duration(milliseconds: audio.duration)
                    .toString()
                    .split('.')
                    .first
                    .padLeft(8, '0'),
                style: normal12White,
              ),
            ),
          ),
          Container(
            width: 80,
            height: 90,
            color: const Color(0x50000000),
            child: Center(
              child: SvgPicture.asset(
                'assets/ic_play.svg',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _headerWidget() {
    return GestureDetector(
      onTap: onPlayTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            audio.title,
            style: bold20White,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  GestureDetector _authorWidget() {
    return GestureDetector(
      onTap: () {
        ProfileModule.toOtherProfileId(audio.userId);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Text(
              audio.userName,
              style: normal14Hint,
            ),
          ],
        ),
      ),
    );
  }
}
