import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/themes.dart';

class AudioTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;

  const AudioTile({
    @required this.title,
    @required this.subTitle,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: normal16White,
                  ),
                  Text(
                    subTitle,
                    style: normal14Hint,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/ic_play.svg'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
