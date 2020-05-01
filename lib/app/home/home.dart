import 'package:flutter/material.dart';
import 'package:highvibe/app/home/authors_widget.dart';
import 'package:highvibe/app/home/tools_widget.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/event_card.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/stream_card.dart';

import 'header_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(bottom: 80),
        children: <Widget>[
          HeaderWidget(),
          _liveNowWidget(context),
          AuthorsWidget(),
          _upcomingEventsWidget(),
          ToolsWidget(),
        ],
      ),
    );
  }

  Widget _liveNowWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: HeaderRow(
            title: Strings.liveNow,
            leading: CircleAvatar(
              backgroundColor: redColor,
              radius: 4,
            ),
            showTrailing: true,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.33,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12),
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

  Widget _upcomingEventsWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
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
