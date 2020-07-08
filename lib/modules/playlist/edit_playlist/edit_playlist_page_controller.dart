import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';

part 'edit_playlist_page_controller.g.dart';

class EditPlaylistController = _EditPlaylistControllerBase
    with _$EditPlaylistController;

abstract class _EditPlaylistControllerBase with Store {
  final PlayList playList;

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

  @observable
  List<Audio> audioItems;

  _EditPlaylistControllerBase(this.playList);

  @action
  void deleteAudioFromPlaylist() {}

  @action
  void deletePlaylistCover() => playlistCoverPath = '';

  @action
  void handleListReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final oldItem = audioItems.removeAt(oldIndex);
    audioItems.insert(newIndex, oldItem);
  }

  @action
  void init() {
    titleTextEditingController.text = playList.title;
    descriptionTextEditingController.text = playList.description;
    playlistCoverPath = playList.coverUrlPath;
    privacy = playList.privacy;
    audioItems = playList.audioFiles.toList();
    isPrivate = playList.privacy == Privacy.private ? true : false;
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

  Future<void> _updatePlaylist() async {
    try {
      final playlistCoverStoragePath = await _updatePlaylistCover();

      final playlist = PlayList(
        (b) => b
          ..audioFiles = playList.audioFiles.toBuilder()
          ..coverUrlPath = playlistCoverStoragePath
          ..description = descriptionTextEditingController.text
          ..id = playList.id
          ..title = titleTextEditingController.text
          ..privacy = privacy,
      );

      await _firestorePlaylistService.setPlaylist(playlist: playlist);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> _updatePlaylistCover() async {
    var playlistCoverStoragePath = '';
    print('playlistCoverPath $playlistCoverPath');
    if (playlistCoverPath != playList.coverUrlPath) {
      if (playlistCoverFile == null && playlistCoverPath.isEmpty) {
        playlistCoverStoragePath = PlaylistImageAssets.defaultCover;
      } else {
        playlistCoverStoragePath = await _firebaseStorage.uploadPlaylistCover(
          file: playlistCoverFile,
        );
      }
    } else {
      playlistCoverStoragePath = playList.coverUrlPath;
    }
    return playlistCoverStoragePath;
  }

  @action
  Future<void> savePlaylist() async {
    await _updatePlaylist();
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
