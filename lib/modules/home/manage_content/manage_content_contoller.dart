import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:file_picker/file_picker.dart' show FileType;
import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/home/manage_content/api/firestore_audio_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';
import 'package:universal_html/html.dart' as html;

part 'manage_content_contoller.g.dart';

abstract class ManageContentBase with Store {
  final _firebaseStorage = Modular.get<StorageService>();
  final _firestoreAudioService = Modular.get<FirestoreAudioService>();
  final _currentUserStore = Modular.get<AppController>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController hashtagsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @observable
  html.File audioCoverFile;

  @observable
  html.File audioFile;

  @observable
  bool isUploadingData = false;

  @observable
  bool isAudioCoverFileSelcted = false;

  @observable
  bool isAudioFileSelcted = false;

  @observable
  ObservableList<String> tags;

  bool get isRequiredFieldsWereFilled =>
      isAudioCoverFileSelcted &&
      isAudioFileSelcted &&
      titleController.text.trim().isNotEmpty;

  @action
  Future<void> createAudio() async {
    isUploadingData = true;
    try {
      final results = await Future.wait(
        [
          _firebaseStorage.uploadAudioCoverFromWeb(image: audioCoverFile),
          _firebaseStorage.uploadAudioFileFromWeb(audio: audioFile),
        ],
      );

      final tags = hashtagsController.text.split(',');

      final audioItem = Audio(
        (b) => b
          ..userId = _currentUserStore.currentUser.id
          ..title = titleController.text
          ..subTitle = descriptionController.text
          ..artworkUrlPath = results[0]
          ..audioUrlPath = results[1]
          ..tags = BuiltList<String>(tags).toBuilder(),
      );
      await _firestoreAudioService.setAudioItem(audioItem: audioItem);
      isUploadingData = false;
    } catch (error) {
      isUploadingData = false;
      throw Exception(error.toString());
    }
  }

  @action
  void deleteAudioCoverFile() => audioCoverFile = null;

  @action
  void addTag(String item) => tags.add(item);

  @action
  void deleteTag(String item) => tags.remove(item);

  @action
  void deleteAudioFile() => audioFile = null;

  Future<void> deleteAudioFromFirebase({@required Audio audioItem}) async {
    try {
      await _firestoreAudioService.deleteAudioItem(audioItem: audioItem);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  void dispose() {
    titleController.dispose();
    hashtagsController.dispose();
    descriptionController.dispose();
    searchController.dispose();
  }

  Stream<List<Audio>> fetchAudioItems() {
    return _firestoreAudioService.audioCollectionStream();
  }

  Future<List<Audio>> findAudioItems({
    List<Audio> items,
    String searchTerm,
  }) async {
    return items.where((item) => item.title.startsWith(searchTerm)).toList();
  }

  @action
  void init() {
    titleController.text = '';
    hashtagsController.text = '';
    descriptionController.text = '';
    searchController.text = '';
    audioCoverFile = null;
    audioFile = null;
    isUploadingData = false;
    isAudioFileSelcted = false;
    isAudioCoverFileSelcted = false;
    tags = ObservableList<String>.of([]);
  }

  @action
  void initWithAudio({@required Audio audioItem}) {
    titleController.text = audioItem.title;
    tags = ObservableList<String>.of(audioItem.tags.toList());
    descriptionController.text = audioItem.subTitle;
    searchController.text = '';
    audioCoverFile = null;
    audioFile = null;
    isUploadingData = false;
    isAudioFileSelcted = false;
    isAudioCoverFileSelcted = false;
  }

  @action
  Future<void> selectAudioCover() async {
    try {
      final file = await FilePicker.getFile(type: FileType.image);
      if (file != null) {
        audioCoverFile = file;
        isAudioCoverFileSelcted = true;
      }
    } catch (error) {
      isAudioCoverFileSelcted = false;
      throw Exception(error.toString());
    }
  }

  @action
  Future<void> selectAudioFile() async {
    try {
      final file = await FilePicker.getFile(type: FileType.audio);
      if (file != null) {
        audioFile = file;
        isAudioFileSelcted = true;
      }
    } catch (error) {
      isAudioFileSelcted = false;
      throw Exception(error.toString());
    }
  }

  @action
  Future<void> updateAudio({@required Audio audioItem}) async {
    isUploadingData = true;
    try {
      var coverPathToUpdate = '';
      var audioFilePathToUpdate = '';

      if (audioCoverFile == null) {
        coverPathToUpdate = audioItem.artworkUrlPath;
      } else {
        coverPathToUpdate = await _firebaseStorage.uploadAudioCoverFromWeb(
          image: audioCoverFile,
        );
      }

      if (audioFile == null) {
        audioFilePathToUpdate = audioItem.audioUrlPath;
      } else {
        audioFilePathToUpdate = await _firebaseStorage.uploadAudioFileFromWeb(
          audio: audioFile,
        );
      }

      final tags = hashtagsController.text.split(',');

      final updatedAudioItem = Audio(
        (b) => b
          ..id = audioItem.id
          ..userId = _currentUserStore.currentUser.id
          ..title = titleController.text
          ..subTitle = descriptionController.text
          ..artworkUrlPath = coverPathToUpdate
          ..audioUrlPath = audioFilePathToUpdate
          ..tags = BuiltList<String>(tags).toBuilder(),
      );
      await _firestoreAudioService.setAudioItem(audioItem: updatedAudioItem);
      isUploadingData = false;
    } catch (error) {
      isUploadingData = false;
      throw Exception(error.toString());
    }
  }
}

class ManageContentController = ManageContentBase
    with _$ManageContentController;
