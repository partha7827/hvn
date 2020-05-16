import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/video_player/widgets/widgets.dart'
    show VideoPreviewItem;
import 'package:highvibe/models/models.dart';
import 'package:highvibe/models/video/mock_video_files.dart';
import 'package:highvibe/widgets/header_row.dart';

class VideoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: HeaderRow(
              title: 'Video Demo',
              showTrailing: true,
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              scrollDirection: Axis.horizontal,
              itemCount: mockVideosList.length,
              itemBuilder: (_, index) {
                return VideoPreviewItem(
                  video: mockVideosList[index],
                  onTap: (item) => _showVideoPlayer(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showVideoPlayer(Video video) {
    Modular.to.pushNamed("/videoplayer", arguments: video);
  }
}
