import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';

part 'current_user_controller.g.dart';

class CurrentUserController = _CurrentUserControllerBase
    with _$CurrentUserController;

enum UploadAudioStep {
  chooseAudio,
  uploadAudio,
  processDocument,
  editDocument,
  success,
  error,
  none,
}

abstract class _CurrentUserControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService store = Modular.get<FirestoreService>();
  final AppController app = Modular.get<AppController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  User get currentUser => app.currentUser;

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
      case UploadAudioStep.chooseAudio:
        audioFile = data;
        currentStep = UploadAudioStep.uploadAudio;
        performUpload().then((audioId) => nextStep(data: audioId));
        break;
      case UploadAudioStep.uploadAudio:
        audioId = data;
        currentStep = UploadAudioStep.processDocument;
        whenProcessed().then((audio) {
          nextStep(data: audio);
        });
        break;
      case UploadAudioStep.processDocument:
        audio = data;
        currentStep = UploadAudioStep.success;
        increaseKarma();
        break;
      default:
    }
  }

  @action
  void increaseKarma() {
    app.currentUser = app.currentUser
        .rebuild((b) => b..karmaPoints = b.karmaPoints + audio.karmaReward);
  }

  @observable
  StorageUploadTask storageUploadTask;

  @observable
  bool isUploading = false;

  @action
  Future<String> performUpload() async {
    isUploading = true;
    storageUploadTask = storage.uploadAudio(audioFile, currentUserId);
    final snapshot = await storageUploadTask.onComplete;
    isUploading = false;
    final audioUrl = (await snapshot.ref.getDownloadURL()).toString();

    final audio = Audio(
      (b) => b
        ..userId = currentUserId
        ..userName = currentUserName
        ..userAvatar = currentUserAvatar
        ..audioUrlPath = audioUrl,
    );

    print('audio uploaded: ${audio.id}');

    await store.audioCollection.document(audio.id).setData(audio.toMap());

    return audio.id;
  }

  @action
  Future<Audio> whenProcessed() async {
    final stream = store.audioCollection.document(audioId).snapshots();

    return stream.firstWhere((element) {
      return element.exists &&
          element.data['isProcessed'] == true &&
          element.data['isBroken'] == false;
    }).then((value) => Audio.fromSnapshot(value));
  }

  @observable
  UploadAudioStep currentStep = UploadAudioStep.none;

  void chooseAudio() {
    currentStep = UploadAudioStep.chooseAudio;
  }

  @action
  Future<void> logout() async {
    await auth.logout();
    await app.setCurrentUser(null);
  }
}
