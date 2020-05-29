import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hvn/models/user/user.dart';
import 'package:hvn/values/themes.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Function onTap;

  UserCard(this.user, {this.onTap});

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
              imageUrl: user.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onTap,
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
        ],
      ),
    );
  }
}
