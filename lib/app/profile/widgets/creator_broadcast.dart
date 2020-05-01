import 'package:flutter/material.dart';
import 'package:highvibe/widgets/event_card.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/stream_card.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';

class CreatorBroadcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 20),
      children: <Widget>[
        _liveNowWidget(),
        _upcomingEventsWidget(),
        _pastStreamWidget(context),
      ],
    );
  }

  Widget _liveNowWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        HeaderRow(
          title: Strings.liveNow,
          leading: CircleAvatar(
            backgroundColor: redColor,
            radius: 4,
          ),
        ),
        Container(
          width: double.maxFinite,
          child: StreamCard(
            title: 'Spritual Meditations',
            subTitle: 'Deep knowlege of spritual meditation...',
            shares: '8k',
            reactions: '1.3k',
            messages: '2.0k',
          ),
        ),
      ],
    );
  }

  Widget _upcomingEventsWidget() {
    return Column(
      children: <Widget>[
        HeaderRow(
          title: Strings.upcomingEvents,
          showTrailing: true,
        ),
        Container(
          height: 180,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
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

  Widget _pastStreamWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderRow(
          title: Strings.pastStreams,
          showTrailing: true,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamCard(
                  title: 'Spritual Meditations',
                  subTitle: 'Deep knowlege of spritual meditation...',
                  shares: '8k',
                  reactions: '1.3k',
                  messages: '2.0k',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
