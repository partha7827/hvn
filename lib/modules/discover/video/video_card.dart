import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/assets.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/stream_card.dart';

class VideoCard extends StatelessWidget {
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: double.maxFinite,
            height: 180,
            imageUrl: dummyImgUrl,
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
              '30 Mins',
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
                'Spritual Meditation',
                style: normal16White,
              ),
              GradientOutlineButton(
                minHeight: 24,
                radius: 50,
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset('assets/ic_date.svg'),
                ),
                label: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Text(
                    'April 18, 2020',
                    style: normal12White,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                _userAvatar(),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: _userAvatar(),
                ),
                Transform.translate(
                  offset: Offset(-16, 0),
                  child: _userAvatar(),
                ),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: Text(
                    '5.3k members joined',
                    style: normal14Hint,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _userAvatar() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: primaryColor, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          imageUrl: Assets.dummyAvatarUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
