import 'dart:io' show File, Platform;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/utils/supported_audio_types.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:mobx/mobx.dart';

import 'upload_audio_controller.dart';

class UploadAudioPage extends StatefulWidget {
  const UploadAudioPage();

  @override
  _UploadAudioPageState createState() => _UploadAudioPageState();
}

class _UploadAudioPageState
    extends ModularState<UploadAudioPage, UploadAudioController> {
  @override
  Widget build(BuildContext context) {
    print('build upload audio page');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Audio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: controller.nextStep,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          switch (controller.currentStep) {
            case UploadAudioStep.askChooseAudio:
              return _askChooseAudio();
              break;
            case UploadAudioStep.uploadAudio:
              return _uploadAudio();
              break;
            case UploadAudioStep.processDocument:
              return _processDocument();
              break;
            case UploadAudioStep.success:
              return _success();
              break;
            case UploadAudioStep.error:
              return _error();
              break;
            default:
              return Container();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    setupReactions();
    super.initState();
  }

  void setupReactions() {
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
        }

        if (isAudioFileType) {
          controller.nextStep(data: file);
          when((_) => controller.currentStep == UploadAudioStep.editDocument,
              () {
            ProfileModule.toEditAudio(controller.audio);
          });
        } else {
          print('HANDLE THIS CASE!');
        }
      },
    );
  }

  Widget _askChooseAudio() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          UploadAudioStrings.askChooseAudio,
          style: bold24PlayfairWhite,
        ),
      ),
    );
  }

  Widget _error() => Container(
        child: Text(
          UploadAudioStrings.error,
          style: bold20PlayfairWhite,
        ),
      );

  Widget _processDocument() => Column(
        children: <Widget>[
          const SplashWidget(),
          const SizedBox(height: 10),
          const Text(UploadAudioStrings.processDocument),
        ],
      );

  Widget _success() => Column(
        children: <Widget>[
          const Text(UploadAudioStrings.success),
          Text('${controller.karmaPoints} Karma Points'),
        ],
      );

  Widget _uploadAudio() => Column(
        children: <Widget>[
          const SplashWidget(),
          const SizedBox(height: 10),
          const Text(UploadAudioStrings.uploadAudio),
        ],
      );
}
