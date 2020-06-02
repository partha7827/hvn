import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/discover/audios/audio_card.dart';
import 'package:highvibe/modules/discover/audios/discover_audios_controller.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

class DiscoverAudiosView extends StatefulWidget {
  const DiscoverAudiosView({this.users});

  final BuiltList<User> users;

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
            return const SplashWidget();
        }
      },
    );
  }

  Widget buildAudios(List<Audio> audios) => ListView.builder(
        itemBuilder: (_, index) {
          User audioAuthor;
          if (widget.users != null) {
            for (var i = 0; i < widget.users.length; i++) {
              if (widget.users[i].id == audios[index].userId) {
                audioAuthor = widget.users[i];
                break;
              }
            }
          }

          return AudioCard(
            audios[index],
            audioAuthor,
            onPlayTap: () => MediaOverlays.presentAudioPlayerAsOverlay(
              context: context,
              audioFile: audios[index],
            ),
          );
        },
        itemCount: audios.length,
      );
}
