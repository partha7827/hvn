import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final Function onPlayTap;

  VideoCard(this.video, {this.onPlayTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Column(
        children: [
          _playerWidget(),
          _infoWidget(),
        ],
      ),
    );
  }

  _playerWidget() {
    return InkWell(
      onTap: onPlayTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: double.maxFinite,
              height: 180,
              imageUrl: video.snippet.videoThumbnail.url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                Duration(milliseconds: video.fileDetails.durationMs)
                    .toString()
                    .split('.')
                    .first
                    .padLeft(8, "0"),
                style: normal12White,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0x40000222),
                child: Center(
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                video.snippet.title,
                style: normal16White,
              ),
              video.snippet.tags.isNotEmpty
                  ? GradientOutlineButton(
                      minHeight: 24,
                      radius: 50,
                      onPressed: () {},
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Text(
                          video.snippet.tags[0],
                          style: normal12White,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
