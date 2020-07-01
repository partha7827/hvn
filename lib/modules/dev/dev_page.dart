import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/mock_audio_files.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'dev_controller.dart';

class DevPage extends StatefulWidget {
  const DevPage();

  @override
  _DevPageState createState() => _DevPageState();
}

class _DevPageState extends ModularState<DevPage, DevController> {
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: GradientOutlineButton(
              label: Text('Open Track', style: bold16White),
              onPressed: () {
                // MediaOverlays.presentAudioPlayerAsOverlay(
                //     context: context, audioFile: mockAudioItemsList[0]);
                controller.toAudioPlayer(context: context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
