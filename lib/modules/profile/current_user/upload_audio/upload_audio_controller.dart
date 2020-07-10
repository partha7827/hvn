import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';

part 'upload_audio_controller.g.dart';

enum UploadAudioStep {
  askChooseAudio, // welcome here... agree on ownership and click next
  chooseAudio, // file manager to choose audio file - navigator pop with file
  askChooseCover, // pick up thumnbnail for your audio file
  chooseCover, // file manage to choose image file - async function returns file
  // ignore: lines_longer_than_80_chars
  uploadAudioAndCover, // straight after choosing cover - we upload files to fire storage and create document in firestore
  processDocument, // still show splash loading screen but with different caption - now processing the file
  editDocument, // show screen with all fields of upload audio and allow to edit these fields
  success, // congratulations and give karma points
  error // show error and allow to return back to profile ie navigator pop
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

  String audioId;
  File audioFile;
  File coverFile;
  int karmaPoints;

  @action
  void nextStep({dynamic data}) {
    switch (currentStep) {
      case UploadAudioStep.askChooseAudio:
        currentStep = UploadAudioStep.chooseAudio;
        break;
      case UploadAudioStep.chooseAudio:
        audioFile = data;
        currentStep = UploadAudioStep.askChooseCover;
        break;
      case UploadAudioStep.askChooseCover:
        currentStep = UploadAudioStep.chooseCover;
        break;
      case UploadAudioStep.chooseCover:
        coverFile = data;
        currentStep = UploadAudioStep.uploadAudioAndCover;
        performUpload().then((audioId) => nextStep(data: audioId));
        break;
      case UploadAudioStep.uploadAudioAndCover:
        audioId = data;
        currentStep = UploadAudioStep.processDocument;
        whenProcessed().then((karmaPoints) => nextStep(data: karmaPoints));
        break;
      case UploadAudioStep.processDocument:
        karmaPoints = data;
        currentStep = UploadAudioStep.editDocument;
        break;
      case UploadAudioStep.editDocument:
        currentStep = UploadAudioStep.success;
        break;
      default:
    }
  }

  @action
  Future<String> performUpload() async {
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

    return audio.id;
  }

  @action
  Future<int> whenProcessed() async {
    final stream = store.audioCollection.document(audioId).snapshots();

    final event = await stream.first;

    final audio = Audio.fromSnapshot(event);

    if (audio.isProcessed) {
      return audio.karmaReward;
    } else {
      return 0;
    }
  }

  @observable
  String errorMessage;

  @observable
  UploadAudioStep currentStep = UploadAudioStep.askChooseAudio;

  @observable
  FutureStatus uploadStatus = FutureStatus.fulfilled;
}
