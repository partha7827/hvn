import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/audio/audio.dart';
import 'package:hvn/modules/audio_player/audio_player_module.dart';
import 'package:hvn/modules/discover/audios/audio_card.dart';
import 'package:hvn/modules/discover/audios/discover_audios_controller.dart';
import 'package:hvn/widgets/repeat_widget.dart';
import 'package:hvn/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

class DiscoverAudiosView extends StatefulWidget {
  @override
  _DiscoverAudiosViewState createState() => _DiscoverAudiosViewState();
}

class _DiscoverAudiosViewState
    extends ModularState<DiscoverAudiosView, DiscoverAudiosController> {
  @override
  void initState() {
    super.initState();
    controller.loadAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (controller.audios.status) {
          case FutureStatus.fulfilled:
            return buildAudios(controller.audios.value.toList());
          case FutureStatus.rejected:
            return RepeatWidget(controller.loadAudios);
          default:
            return SplashWidget();
        }
      },
    );
  }

  Widget buildAudios(List<Audio> audios) => ListView.builder(
        itemBuilder: (_, index) => AudioCard(
          audios[index],
          onPlayTap: () => AudioPlayerModule.toPlayer(audios[index]),
        ),
        itemCount: audios.length,
      );
}
