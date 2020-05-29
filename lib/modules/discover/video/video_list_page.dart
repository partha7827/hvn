import 'package:flutter/material.dart';
import 'package:hvn/modules/discover/video/video_card.dart';

class VideoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return VideoCard();
        },
      ),
    );
  }
}
