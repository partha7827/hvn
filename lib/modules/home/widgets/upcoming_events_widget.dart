import 'package:flutter/material.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/widgets/event_card.dart';
import 'package:highvibe/widgets/header_row.dart';

class UpcomingEventsWidget extends StatelessWidget {
  const UpcomingEventsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: HeaderRow(
            title: Strings.upcomingEvents,
            showTrailing: true,
          ),
        ),
        Container(
          height: 180,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: EventCard(
                  title: 'Best Meditation For Anxiety',
                  startTime: DateTime.now(),
                  endTime: DateTime.now(),
                  members: '1.7k',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
