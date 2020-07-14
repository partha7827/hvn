import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/discover/audios/audio_card.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverAudiosView extends StatefulWidget {
  const DiscoverAudiosView();

  @override
  _DiscoverAudiosViewState createState() => _DiscoverAudiosViewState();
}

class _DiscoverAudiosViewState
    extends ModularState<DiscoverAudiosView, DiscoverAudiosController>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  double _opacity = 0.0;
  Timer _timer;
  bool audioLoaded = false;

  @override
  void initState() {
    super.initState();
    controller.loadAudios();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void changeOpacity() async {
    _timer = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Observer(
        builder: (_) {
          switch (controller.audios.status) {
            case FutureStatus.fulfilled:
              return buildAudios(controller.audios.value.toList());
            case FutureStatus.rejected:
              return RepeatWidget(controller.loadAudios);
            default:
              print('default');
              return _shimmers();
          }
        },
      ),
    );
  }

  Widget buildAudios(List<Audio> audios) => ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return AudioCard(
            audios[index],
            onPlayTap: () => MediaOverlays.presentAudioPlayerAsOverlay(
              context: context,
              audioFile: audios[index],
            ),
          );
        },
        itemCount: audios.length,
      );

  Widget _shimmers() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 24),
            child: Shimmer.fromColors(
              baseColor: Colors.white12,
              highlightColor: Colors.white38,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(right: 16),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 20,
                          width: screenWidth(context) * 0.8,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 20,
                          width: screenWidth(context) * 0.4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}
