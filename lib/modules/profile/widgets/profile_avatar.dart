import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/values/themes.dart';

class ProfileAvatar extends StatelessWidget {
  final String photoUrl;

  const ProfileAvatar(this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        gradient: primaryGradient,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          width: 105,
          height: 105,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: ClipOval(
              child: photoUrl.isEmpty
                  ? Image.asset('assets/ic_profile_placeholder.png')
                  : CachedNetworkImage(
                      imageUrl: photoUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
