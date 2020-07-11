import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';

part 'edit_audio_controller.g.dart';

class EditAudioController = _EditAudioControllerBase with _$EditAudioController;

abstract class _EditAudioControllerBase with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final StorageService storage = Modular.get<StorageService>();
  final AppController app = Modular.get<AppController>();

  Audio audio;
  _EditAudioControllerBase(this.audio);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey formKey = GlobalKey<FormState>();

  String get currentUserId => app.currentUser.id;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  @observable
  String coverUrl;

  @action
  Future<void> updateAudio() async {
    final title = titleController.text;
    final subtitle = subtitleController.text;

    if (title == audio.title && subtitle == audio.subTitle) return;

    audio = audio.rebuild((b) => b
      ..title = title
      ..subTitle = subtitle);

    await firestore.audioCollection
        .document(audio.id)
        .updateData(audio.toMap());
  }

  @action
  Future<void> updateCover(File file) async {
    coverUrl = await storage.uploadAudioThumb(file, currentUserId);

    audio = audio.rebuild((b) => b..artworkUrlPath = coverUrl);

    await firestore.audioCollection
        .document(audio.id)
        .updateData(audio.toMap());
  }
}
