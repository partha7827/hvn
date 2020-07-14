import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/video/video.dart';
import 'package:highvibe/modules/discover/videos/discover_videos_controller.dart';
import 'package:highvibe/modules/discover/videos/video_card.dart';
import 'package:highvibe/modules/video_player/video_player_module.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
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
          return const SplashWidget();
      }
    },);
  }

  Widget buildVideos(List<Video> videos) => ListView.builder(
        itemCount: videos.length,
        itemBuilder: (_, index) => VideoCard(videos[index],
            onPlayTap: () => VideoPlayerModule.toPlayer(videos[index])),
      );
}
