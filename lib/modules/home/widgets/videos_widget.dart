import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/video/video.dart';
import 'package:highvibe/modules/discover/discover_module.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/video_player/video_player_module.dart';
import 'package:highvibe/modules/video_player/widgets/video_preview_item.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/page_indicator.dart';
import 'package:mobx/mobx.dart';

class VideosWidget extends StatefulWidget {
  @override
  _VideosWidgetState createState() => _VideosWidgetState();
}

class _VideosWidgetState extends ModularState<VideosWidget, HomeController> {
  final PageController sliderController = PageController();

  @override
  void initState() {
    super.initState();
    controller.loadRecommendedVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.videos.status == FutureStatus.fulfilled &&
          controller.videos.value.isNotEmpty) {
        return buildVideos(controller.videos.value);
      } else {
        return Container();
      }
    });
  }

  Widget buildVideos(BuiltList<Video> videos) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: HeaderRow(
              title: Strings.recommendedVideos,
              showTrailing: true,
              onPressedTrailing: DiscoverModule.toDiscoverVideos,
            ),
          ),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: sliderController,
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (_, index) => VideoPreviewItem(
                video: videos[index],
                onTap: (item) => VideoPlayerModule.toPlayer(videos[index]),
              ),
            ),
          ),
          PageIndicator(
            controller: sliderController,
            count: videos.length,
          ),
        ],
      ),
    );
  }
}
