import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/modules/discover/audio/audio_card.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class CreatorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              width: 48,
              height: 48,
              imageUrl: dummyAvatarUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Angela Stevens',
                    style: normal16White,
                  ),
                  Text(
                    '1.4 k Followers',
                    style: normal14Hint,
                  )
                ],
              ),
            ),
          ),
          GradientRaisedButton(
            label: Strings.follow,
            minHeight: 40,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}