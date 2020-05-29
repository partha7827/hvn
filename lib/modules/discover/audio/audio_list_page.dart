import 'package:flutter/material.dart';
import 'package:hvn/modules/discover/audio/audio_card.dart';

class AudioListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return AudioCard();
        },
      ),
    );
  }
}
