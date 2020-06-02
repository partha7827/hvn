import 'package:flutter/material.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String members;

  const EventCard({
    @required this.title,
    @required this.startTime,
    @required this.endTime,
    this.members = '0',
  });

  @override
  Widget build(BuildContext context) {
    final _startTime = DateFormat('h:mm aa').format(startTime);
    final _endTime = DateFormat('h:mm aa').format(endTime);
    return Container(
      width: 280,
      height: 160,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: bold20PlayfairWhite,
            ),
            GradientOutlineButton(
              radius: 50,
              minHeight: 32,
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$_startTime - $_endTime',
                  style: normal12Accent,
                ),
              ),
              onPressed: () {},
            ),
            Text(
              '$members ${Strings.membersJoined}',
              style: normal12Hint,
            ),
          ],
        ),
      ),
    );
  }
}
