import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/profile/video/video_controller.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:highvibe/widgets/video_tile.dart';
import 'package:mobx/mobx.dart';
import 'video_controller.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends ModularState<VideoPage, VideoController> {
  @override
  void initState() {
    super.initState();
    controller.loadVideos();
  }

  Widget buildVideos(List<Video> videos) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: [
        const HeaderRow(title: Strings.uploads),
        ...videos
            .map(
              (item) => VideoTile(
                videoFile: item,
                onItemTapped: (_) => _showVideoPlayer(context, item),
              ),
            )
            .toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (controller.videos.status) {
        case FutureStatus.fulfilled:
          return buildVideos(controller.videos.value);
        case FutureStatus.rejected:
          return RepeatWidget(controller.loadVideos);
        default:
          return const SplashWidget();
      }
    });
  }

  void _showVideoPlayer(BuildContext context, Video videoFile) {
    Modular.to.pushNamed('/videoplayer', arguments: videoFile);
  }
}
