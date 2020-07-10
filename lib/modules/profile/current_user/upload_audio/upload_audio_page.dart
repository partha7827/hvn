import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/utils/utils.dart';
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
  void initState() {
    setupReactions();
    super.initState();
  }

  void setupReactions() {
    when((_) => controller.currentStep == UploadAudioStep.chooseAudio,
        () async {
      final file = await FilePicker.getFile(type: FileType.audio);
      controller.nextStep(data: file);
    });

    when((_) => controller.currentStep == UploadAudioStep.chooseCover,
        () async {
      final file = await FilePicker.getFile(type: FileType.image);
      controller.nextStep(data: file);
    });

    when((_) => controller.currentStep == UploadAudioStep.editDocument,
        () async {
      ProfileModule.toEditAudio(controller.audioId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Audio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: controller.nextStep,
          ),
        ],
      ),
      body: Observer(builder: (_) {
        switch (controller.currentStep) {
          case UploadAudioStep.askChooseAudio:
            return _askChooseAudio();
            break;
          case UploadAudioStep.askChooseCover:
            return _askChooseCover();
            break;
          case UploadAudioStep.uploadAudioAndCover:
            return _uploadAudioAndCover();
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
      }),
    );
  }

  Widget _askChooseAudio() => Center(
        child: Text(UploadAudioStrings.chooseAudio, style: bold24PlayfairWhite),
      );

  Widget _askChooseCover() => Center(
        child: Text(UploadAudioStrings.chooseCover, style: bold24PlayfairWhite),
      );

  Widget _uploadAudioAndCover() => Column(
        children: <Widget>[
          const SplashWidget(),
          const SizedBox(height: 10),
          Text(UploadAudioStrings.uploadAudioAndCover),
        ],
      );

  Widget _processDocument() => Column(
        children: <Widget>[
          const SplashWidget(),
          const SizedBox(height: 10),
          Text(UploadAudioStrings.processDocument),
        ],
      );

  Widget _success() => Column(
        children: <Widget>[
          Text(UploadAudioStrings.success),
          Text('${controller.karmaPoints} Karma Points'),
        ],
      );

  Widget _error() => Container(
      child: Text(controller.errorMessage, style: bold20PlayfairWhite));
}
