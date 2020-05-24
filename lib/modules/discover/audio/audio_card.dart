import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/stream_card.dart';

var dummyAvatarUrl =
    'https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

class AudioCard extends StatelessWidget {
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _infoWidget(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _playWidget() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 80,
            height: 90,
            imageUrl: dummyImgUrl,
            fit: BoxFit.cover,
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
    );
  }

  _headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Relaxing Flute',
          style: bold20White,
        ),
        SvgPicture.asset('assets/ic_favorite.svg'),
      ],
    );
  }

  _authorWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: dummyAvatarUrl,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Angela Stevens',
              style: normal14Hint,
            ),
          ),
        ],
      ),
    );
  }

  _infoWidget() {
    return Row(
      children: <Widget>[
        Text(
          '8k ${Strings.reactions}',
          style: normal10Hint,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CircleAvatar(
            radius: 2,
            backgroundColor: hintTextColor,
          ),
        ),
        Text(
          '2.3k ${Strings.messages}',
          style: normal10Hint,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CircleAvatar(
            radius: 2,
            backgroundColor: hintTextColor,
          ),
        ),
        Text(
          '2.6k ${Strings.shares}',
          style: normal10Hint,
        ),
      ],
    );
  }
}
