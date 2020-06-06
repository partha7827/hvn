import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/audio_player/widgets/audio_preview_item.dart';
import 'package:highvibe/modules/discover/discover_module.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/page_indicator.dart';
import 'package:mobx/mobx.dart';

class AudiosWidget extends StatefulWidget {
  @override
  _AudiosWidgetState createState() => _AudiosWidgetState();
}

class _AudiosWidgetState extends ModularState<AudiosWidget, HomeController> {
  final PageController sliderController = PageController();

  @override
  void initState() {
    super.initState();
    controller.loadRecommendedAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final isVisible = controller.audios.status == FutureStatus.fulfilled &&
          controller.audios.value.isNotEmpty;

      return AnimatedOpacity(
        child: isVisible ? buildAudios(controller.audios.value) : Container(),
        opacity: isVisible ? 1 : 0,
        duration: const Duration(seconds: 1),
      );
    });
  }

  Widget buildAudios(BuiltList<Audio> audios) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: HeaderRow(
              title: Strings.recommendedAudios,
              showTrailing: true,
              onPressedTrailing: DiscoverModule.toDiscoverAudios,
            ),
          ),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: sliderController,
              scrollDirection: Axis.horizontal,
              itemCount: audios.length,
              itemBuilder: (_, index) => AudioPreviewItem(
                audio: audios[index],
                onTap: (item) => MediaOverlays.presentAudioPlayerAsOverlay(
                  context: context,
                  audioFile: item,
                ),
              ),
            ),
          ),
          PageIndicator(
            controller: sliderController,
            count: audios.length,
          ),
        ],
      ),
    );
  }
}
