import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/models/message/message.dart';
import 'package:highvibe/values/themes.dart';
import 'package:intl/intl.dart';

class SingleMessageTile extends StatelessWidget {
  final Message message;

  const SingleMessageTile({this.message});

  @override
  Widget build(BuildContext context) {
    var timeFormatter = DateFormat('hh:mm a');
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: CachedNetworkImage(
          imageUrl: message.senderPhotoUrl,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                message.senderName,
                style: bold16White,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: const Color(0xFF73F077),
                ),
              )
            ],
          ),
          Text(
            timeFormatter.format(message.createdAt),
            style: normal12Hint,
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          message.content,
          style: normal14White,
        ),
      ),
    );
  }
}
