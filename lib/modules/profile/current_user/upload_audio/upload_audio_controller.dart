import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';

part 'upload_audio_controller.g.dart';

enum UploadAudioStep {
  askChooseAudio,
  chooseAudio,
  uploadAudio,
  processDocument,
  editDocument,
  success,
  error
}

class UploadAudioController = _UploadAudioControllerBase
    with _$UploadAudioController;

abstract class _UploadAudioControllerBase with Store {
  final AppController app = Modular.get<AppController>();
  final FirestoreService store = Modular.get<FirestoreService>();
  final StorageService storage = Modular.get<StorageService>();

  String get currentUserId => app.currentUser.id;
  String get currentUserName => app.currentUser.name;
  String get currentUserAvatar => app.currentUser.photoUrl;

  Audio audio;
  String audioId;
  File audioFile;
  File coverFile;
  int karmaPoints;

  @action
  void nextStep({Object data}) {
    switch (currentStep) {
      case UploadAudioStep.askChooseAudio:
        currentStep = UploadAudioStep.chooseAudio;
        break;
      case UploadAudioStep.chooseAudio:
        audioFile = data;
        currentStep = UploadAudioStep.uploadAudio;
        performUpload().then((_) => nextStep());
        break;
      case UploadAudioStep.uploadAudio:
        currentStep = UploadAudioStep.processDocument;
        whenProcessed().then((audio) => nextStep(data: audio));
        break;
      case UploadAudioStep.processDocument:
        audio = data;
        currentStep = UploadAudioStep.editDocument;
        break;
      case UploadAudioStep.editDocument:
        currentStep = UploadAudioStep.success;
        break;
      default:
    }
  }

  @action
  Future<void> performUpload() async {
    final audioUrl = await storage.uploadAudio(audioFile, currentUserId);
    final coverUrl = await storage.uploadAudioThumb(coverFile, currentUserId);

    final audio = Audio(
      (b) => b
        ..userId = currentUserId
        ..userName = currentUserName
        ..userAvatar = currentUserAvatar
        ..artworkUrlPath = coverUrl
        ..audioUrlPath = audioUrl,
    );

    await store.audioCollection.document(audio.id).setData(audio.toMap());
  }

  @action
  Future<Audio> whenProcessed() async {
    // return Future<Audio>.delayed(const Duration(seconds: 1)).then(
    //   (value) => Audio(
    //     (b) => b
    //       ..userId = currentUserId
    //       ..userName = currentUserName
    //       ..userAvatar = currentUserAvatar
    //       ..karmaReward = 42,
    //   ),
    // );
    final stream = store.audioCollection.document(audioId).snapshots();
    final event = await stream.first;
    return Audio.fromSnapshot(event);
  }

  @observable
  UploadAudioStep currentStep = UploadAudioStep.askChooseAudio;
}
