import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/audio_tile.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/repeat_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';

import 'show_audio_controller.dart';

class ShowAudioPage extends StatefulWidget {
  @override
  _ShowAudioPageState createState() => _ShowAudioPageState();
}

class _ShowAudioPageState
    extends ModularState<ShowAudioPage, ShowAudioController> {
  ReactionDisposer disposeReaction;

  @override
  void initState() {
    super.initState();
    controller.loadAudios();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Observer(
        builder: (_) {
          switch (controller.audios.status) {
            case FutureStatus.fulfilled:
              return buildAudios(controller.audios.value);
            case FutureStatus.rejected:
              return RepeatWidget(controller.loadAudios);
            default:
              return _shimmers();
          }
        },
      ),
    );
  }

  Widget buildAudios(List<Audio> audios) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const HeaderRow(title: Strings.uploads),
            if (controller.isCurrentUser)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: GradientOutlineButton(
                    onPressed: ProfileModule.toUploadAudio,
                    label: Text(Strings.uploadAudio, style: normal16Accent),
                  ),
                ),
              ),
          ],
        ),
        for (final item in audios) ...[
          AudioTile(
            audioFile: item,
            onTap: (_) => MediaOverlays.presentAudioPlayerAsOverlay(
              context: context,
              audioFile: item,
            ),
          ),
        ],
      ],
    );
  }

  Widget _shimmers() {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      highlightColor: Colors.white38,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 24,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 12,
                              width: screenWidth(context) * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              height: 12,
                              width: screenWidth(context) * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                        ),
                        height: 30,
                        width: 10,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
