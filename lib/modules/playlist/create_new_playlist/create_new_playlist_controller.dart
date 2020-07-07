import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show Audio, PlayList, Privacy;
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'create_new_playlist_controller.g.dart';

class CreateNewPlaylistController = _CreateNewPlaylistControllerBase
    with _$CreateNewPlaylistController;

abstract class _CreateNewPlaylistControllerBase with Store {
  final _firebaseStorage = Modular.get<StorageService>();
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  final TextEditingController titleTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();

  @observable
  String playlistCoverPath;

  @observable
  Privacy privacy;

  @observable
  bool isPrivate;

  @observable
  File playlistCoverFile;

  @action
  Future<void> createPlaylist() async {
    try {
      final uuid = Uuid();
      var playlistCoverStoragePath = '';

      if (playlistCoverFile == null) {
        playlistCoverStoragePath = _defaultCover;
      } else {
        playlistCoverStoragePath = await _firebaseStorage.uploadPlaylistCover(
          file: playlistCoverFile,
        );
      }

      final playlist = PlayList(
        (b) => b
          ..audioFiles = BuiltList<Audio>().toBuilder()
          ..coverUrlPath = playlistCoverStoragePath
          ..description = descriptionTextEditingController.text
          ..id = uuid.v4()
          ..title = titleTextEditingController.text
          ..privacy = privacy,
      );

      await _firestorePlaylistService.setPlaylist(playlist: playlist);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @action
  void deletePlaylistCover() => playlistCoverPath = '';

  @action
  void init() {
    titleTextEditingController.text = '';
    descriptionTextEditingController.text = '';
    playlistCoverPath = '';
    privacy = Privacy.private;
    isPrivate = true;
  }

  @action
  Future<void> selectPlaylistCover() async {
    try {
      final file = await FilePicker.getFile(type: FileType.image);
      if (file != null) {
        playlistCoverPath = file.path;
        playlistCoverFile = file;
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @action
  void togglePrivacy() {
    if (isPrivate) {
      privacy = Privacy.public;
      isPrivate = false;
    } else {
      privacy = Privacy.private;
      isPrivate = true;
    }
  }
}

final _defaultCover =
    'https://images.unsplash.com/photo-1593455071238-92dd081a39b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80';
