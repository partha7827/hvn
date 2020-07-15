import 'dart:io' show File, Platform;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/widgets/ui_utils.dart';
import 'package:highvibe/utils/supported_audio_types.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';

import 'upload_audio_controller.dart';

class UploadAudioPage extends StatefulWidget {
  const UploadAudioPage();

  @override
  _UploadAudioPageState createState() => _UploadAudioPageState();
}

class _UploadAudioPageState
    extends ModularState<UploadAudioPage, UploadAudioController>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this)
      ..value = 0
      ..duration = const Duration(seconds: 3);

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Audio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.cancel, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) => Stack(
          children: <Widget>[
            _backgroundImage(context),
            _animatedProgress(),
          ],
        ),
      ),
    );
  }

  Container _animatedProgress() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 133,
              width: 281,
              child: Lottie.asset(
                'assets/animation/splash_animation.json',
                controller: animationController,
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                switch (controller.currentStep) {
                  case UploadAudioStep.uploadAudio:
                    return Text(UploadAudioStrings.uploadAudio,
                        style: bold20PlayfairWhite);
                  case UploadAudioStep.processDocument:
                    return Text(UploadAudioStrings.processDocument,
                        style: bold20PlayfairWhite);
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _backgroundImage(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context),
      child: Image.asset(
        'assets/ic_splash_background.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    when(
      (_) => controller.currentStep == UploadAudioStep.chooseAudio,
      () async {
        File file;
        var isAudioFileType = true;

        if (Platform.isIOS) {
          file = await FilePicker.getFile(type: FileType.any);
          isAudioFileType = isAudioFile(file: file);
        } else {
          file = await FilePicker.getFile(type: FileType.audio);
          isAudioFileType = isAudioFile(file: file);
        }

        if (isAudioFileType) {
          controller.nextStep(data: file);
        } else {
          Modular.to.pop();
        }
      },
    );
    when((_) => controller.currentStep == UploadAudioStep.success,
        () async {
//      await ProfileModule.toEditAudio(controller.audio);
      showSuccessDialog(
        context: context,
        isPresentedAsOverlay: false,
        title: 'Karma Reward',
        subTitle: 'You received ${controller.audio.karmaReward} Karma',
      );
    });
  }
}
