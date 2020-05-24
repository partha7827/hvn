import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/stream_card.dart';

class CreatorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      width: 100,
                      height: 100,
                      imageUrl: dummyImgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _audioWidget(),
                              _audioWidget(),
                              _audioWidget(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: hintTextColor,
                                ),
                                Text(
                                  ' 10 Meditations',
                                  style: normal14Hint,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    radius: 2,
                                    backgroundColor: hintTextColor,
                                  ),
                                ),
                                Text(
                                  ' 2 Playlist',
                                  style: normal14Hint,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jayden Massey',
                        style: bold18White,
                      ),
                      Text(
                        '1.4k Followers',
                        style: normal14Hint,
                      )
                    ],
                  ),
                ),
                GradientRaisedButton(
                  label: Strings.follow,
                  minHeight: 40,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _audioWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          CachedNetworkImage(
            width: 56,
            height: 56,
            imageUrl: dummyImgUrl,
            fit: BoxFit.cover,
          ),
          Container(
            width: 56,
            height: 56,
            color: const Color(0x50000000),
            child: Center(
              child: SvgPicture.asset(
                'assets/ic_play.svg',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
