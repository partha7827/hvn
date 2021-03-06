import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/live/live_controller.dart';
import 'package:highvibe/modules/live/live_module.dart';
import 'package:highvibe/widgets/event_card.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/stream_card.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

class LivePage extends StatefulWidget {
  final String userId;
  const LivePage(this.userId);

  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends ModularState<LivePage, LiveController> {
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
        const HeaderRow(
          title: Strings.liveNow,
          leading: CircleAvatar(
            backgroundColor: redColor,
            radius: 4,
          ),
        ),
        Container(
          width: double.maxFinite,
          child: const StreamCard(
            title: 'Spritual Meditations',
            subTitle: 'Deep knowlege of spritual meditation...',
            shares: '8k',
            reactions: '1.3k',
            messages: '2.0k',
          ),
        ),
        OutlineButton(
          child: const Text('JOIN NOW'),
          onPressed: () {
            LiveModule.toLive(widget.userId);
          },
        )
      ],
    );
  }

  Widget _upcomingEventsWidget() {
    return Column(
      children: <Widget>[
        const HeaderRow(
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
        const HeaderRow(
          title: Strings.pastStreams,
          showTrailing: true,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
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
