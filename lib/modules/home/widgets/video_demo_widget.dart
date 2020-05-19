import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/video_player/widgets/widgets.dart'
    show VideoPreviewItem;
import 'package:highvibe/models/models.dart';
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
              title: 'Recommended for You',
              showTrailing: true,
            ),
          ),
          SizedBox(
            height: 240,
            child: FutureBuilder(
              future: Modular.get<HomeController>().getVideos(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return VideoPreviewItem(
                        video: snapshot.data[index],
                        onTap: (item) => _showVideoPlayer(item),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
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
