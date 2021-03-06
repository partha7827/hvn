import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_raised_button.dart';

class AuthorCard extends StatelessWidget {
  final User user;
  final Function onChoose;
  final Function onFollow;
  final bool isFollowing;

  AuthorCard({
    @required this.user,
    @required this.onChoose,
    @required this.onFollow,
    @required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: user.photoUrl.isEmpty
                ? Image.asset('assets/ic_profile_placeholder.png')
                : CachedNetworkImage(
                    width: 48,
                    height: 48,
                    imageUrl: user.photoUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Expanded(
            child: InkWell(
              onTap: onChoose,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: normal16White,
                    ),
                    Text(
                      '${user.followers.length} Followers',
                      style: normal14Hint,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (isFollowing)
            GradientRaisedButton(
              label: Strings.unfollow,
              minHeight: 40,
              onPressed: onFollow,
            )
          else
            GradientRaisedButton(
              label: Strings.follow,
              minHeight: 40,
              onPressed: onFollow,
            ),
        ],
      ),
    );
  }
}
