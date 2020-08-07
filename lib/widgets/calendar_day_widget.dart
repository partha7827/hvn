
import 'package:flutter/material.dart';
import 'package:highvibe/modules/mood_tracker/mood.dart';
import 'package:highvibe/values/themes.dart';

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    Key key,
    @required this.offset,
    @required this.dateTime,
    this.isMoodTracked = false,
    this.mood,
  }) : super(key: key);

  final int offset;
  final DateTime dateTime;
  final bool isMoodTracked;
  final Mood mood;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (isMoodTracked)
            Container(
              height: 36,
              width: 36,
              margin: const EdgeInsets.only(bottom: 4),
              child: Image.asset(mood?.imagePath),
            ),
          if (!isMoodTracked)
            Container(
              height: 36,
              width: 36,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: calendarDayBorderColor,
                  width: 2,
                ),
              ),
            ),
          Text(
            '$offset',
            style: normal14White,
          ),
        ],
      ),
    );
  }
}
