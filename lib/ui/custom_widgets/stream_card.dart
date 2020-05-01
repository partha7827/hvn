import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/ui/creators_profile/creator_audio.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';

class StreamCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String reactions;
  final String messages;
  final String shares;

  const StreamCard({
    @required this.title,
    @required this.subTitle,
    this.reactions = '0',
    this.messages = '0',
    this.shares = '0',
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: dummyImgUrl,
              height: 100,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                title,
                style: bold16White,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                subTitle,
                style: normal14White,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    '$reactions ${Strings.reactions}',
                    style: normal12Hint,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 2,
                      backgroundColor: hintTextColor,
                    ),
                  ),
                  Text(
                    '$messages ${Strings.messages}',
                    style: normal12Hint,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 2,
                      backgroundColor: hintTextColor,
                    ),
                  ),
                  Text(
                    '$shares ${Strings.shares}',
                    style: normal12Hint,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
