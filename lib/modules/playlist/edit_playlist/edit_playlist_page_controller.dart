import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';

part 'edit_playlist_page_controller.g.dart';

final _defaultCover =
    'https://images.unsplash.com/photo-1593455071238-92dd081a39b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80';

class EditPlaylistController = _EditPlaylistControllerBase
    with _$EditPlaylistController;

abstract class _EditPlaylistControllerBase with Store {
  final PlayList playList;

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
    // if (oldIndex < newIndex) {
    //   newIndex -= 1;
    // }
    // setState(() {
    //   final oldItem = _audioItems.removeAt(oldIndex);
    //   _audioItems.insert(newIndex, oldItem);
    // });
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

  Future<void> _updatePlaylist({@required PlayList playlist}) async {
    try {
      await _firestorePlaylistService.setPlaylist(playlist: playlist);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @action
  Future<void> savePlaylist() async {
    //await _updatePlaylist(playlist: updatedPlaylist);
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
