import 'package:flutter/material.dart';
import 'package:highvibe/widgets/stream_card.dart';

class LiveListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
    );
  }
}
