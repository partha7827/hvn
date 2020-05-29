import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/video/video.dart';
import 'package:hvn/modules/discover/videos/discover_videos_controller.dart';
import 'package:hvn/modules/discover/videos/video_card.dart';
import 'package:hvn/modules/video_player/video_player_module.dart';
import 'package:hvn/widgets/repeat_widget.dart';
import 'package:hvn/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

class DiscoverVideosView extends StatefulWidget {
  @override
  _DiscoverVideosViewState createState() => _DiscoverVideosViewState();
}

class _DiscoverVideosViewState
    extends ModularState<DiscoverVideosView, DiscoverVideosController> {
  @override
  void initState() {
    super.initState();
    controller.loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (controller.videos.status) {
        case FutureStatus.fulfilled:
          return buildVideos(controller.videos.value.toList());
        case FutureStatus.rejected:
          return RepeatWidget(controller.loadVideos);
        default:
          return SplashWidget();
      }
    });
  }

  Widget buildVideos(List<Video> videos) => ListView.builder(
        itemCount: videos.length,
        itemBuilder: (_, index) => VideoCard(videos[index], onPlayTap: () => VideoPlayerModule.toPlayer(videos[index])),
      );
}
