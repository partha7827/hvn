import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/discover/audios/audio_card.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:highvibe/widgets/load_widget.dart';
import 'package:mobx/mobx.dart';

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

  @override
  void initState() {
    super.initState();
    controller.loadAudios();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: LoadWidget(
        child: Observer(
          builder: (_) {
            switch (controller.audios.status) {
              case FutureStatus.fulfilled:
                return buildAudios(controller.audios.value.toList());
              case FutureStatus.rejected:
                return RepeatWidget(controller.loadAudios);
              default:
                return const SplashWidget();
            }
          },
        ),
      ),
    );
  }

  Widget buildAudios(List<Audio> audios) => ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return AudioCard(
            audios[index],
            onPlayTap: () => controller.toAudioPlayer(
              context: context,
              audioFile: audios[index],
            ),
          );
        },
        itemCount: audios.length,
      );
}
