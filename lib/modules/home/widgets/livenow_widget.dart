import 'package:flutter/material.dart';
import 'package:hvn/values/Strings.dart';
import 'package:hvn/values/themes.dart';
import 'package:hvn/widgets/header_row.dart';
import 'package:hvn/widgets/stream_card.dart';

class LiveNowWidget extends StatelessWidget {
  const LiveNowWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
