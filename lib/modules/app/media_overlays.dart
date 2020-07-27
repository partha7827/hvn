import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio, Video;
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/audio_player/audio_player_module.dart';
import 'package:highvibe/modules/audio_player/audio_player_page.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_module.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_module.dart';
import 'package:highvibe/modules/playlist/open_playlist/open_playlist_module.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';

class MediaOverlays {
  static GlobalKey<AudioPlayerPageState> audioKey = GlobalKey();

  static OverlayState _mediaOverlayState;

  static OverlayEntry _videoOverlayEntry;
  static OverlayEntry _audioOverlayEntry;
  static OverlayEntry _addToPlaylistOverlayEntry;
  static OverlayEntry _createNewPlaylistOverlayEntry;
  static OverlayEntry _modalAlertOverlayEntry;

  MediaOverlays._();

  static void disposeAddToPlaylistOverlayEntry() {
    _addToPlaylistOverlayEntry?.remove();
    _addToPlaylistOverlayEntry = null;
  }

  static void disposeAudioOverlayEntry() {
    _audioOverlayEntry?.remove();
    _audioOverlayEntry = null;
    audioKey?.currentState?.controller?.player?.stop();
  }

  static void disposeCreateNewPlaylistOverlayEntry() {
    _createNewPlaylistOverlayEntry?.remove();
    _createNewPlaylistOverlayEntry = null;
  }

  static void disposeModalAlertOverlayEntry() {
    _modalAlertOverlayEntry?.remove();
    _modalAlertOverlayEntry = null;
  }

  static void disposeVideoOverlayEntry() {
    _videoOverlayEntry?.remove();
    _videoOverlayEntry = null;
  }

  static void presentAddToPlaylistAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    _mediaOverlayState = Overlay.of(context);

    _addToPlaylistOverlayEntry = OverlayEntry(
      builder: (_) => AddToPlaylistModule(
        audioFile: audioFile,
        isPresentedAsOverlay: true,
      ),
    );

    _mediaOverlayState.insert(
      _addToPlaylistOverlayEntry,
      above: _audioOverlayEntry,
    );
  }

  static void presentAudioPlayerAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    _removeAllOverlays();

    _mediaOverlayState = Overlay.of(context);

    _audioOverlayEntry = OverlayEntry(
      builder: (_) => AudioPlayerModule(audioFile: audioFile),
    );
    _mediaOverlayState.insert(_audioOverlayEntry);
  }

  static void presentPlayListPlayerAsOverlay({
    @required BuildContext context,
    @required PlayList playList,
  }) {
    _removeAllOverlays();

    _mediaOverlayState = Overlay.of(context);

    _audioOverlayEntry = OverlayEntry(
      builder: (_) => OpenPlayListModule(
        playList: playList,
      ),
    );
    _mediaOverlayState.insert(_audioOverlayEntry);
  }

  static void presentCreateNewPlaylistAsOverlay({
    @required BuildContext context,
    Function callback,
  }) {
    _mediaOverlayState = Overlay.of(context);

    _createNewPlaylistOverlayEntry = OverlayEntry(
      builder: (_) => CreateNewPlaylistModule(
          isPresentedAsOverlay: true, callback: callback),
    );

    _mediaOverlayState.insert(
      _createNewPlaylistOverlayEntry,
      above: _addToPlaylistOverlayEntry,
    );
  }

  static void presentShowDialogAsOverlay({
    @required BuildContext context,
    @required PlaylistModalAlert modalAlert,
  }) {
    _mediaOverlayState = Overlay.of(context);

    _modalAlertOverlayEntry = OverlayEntry(builder: (_) => modalAlert);

    _mediaOverlayState.insert(
      _modalAlertOverlayEntry,
      above: _createNewPlaylistOverlayEntry,
    );
  }

  static void presentVideoPlayerAsOverlay({
    @required BuildContext context,
    @required Video video,
  }) {
    _mediaOverlayState = Overlay.of(context);

    _removeAllOverlays();

    _videoOverlayEntry = OverlayEntry(
      builder: (_) => VideoPlayerPage(video: video),
    );
    _mediaOverlayState.insert(_videoOverlayEntry);
  }

  static void _removeAllOverlays() {
    disposeAudioOverlayEntry();
    disposeVideoOverlayEntry();
    disposeAddToPlaylistOverlayEntry();
  }
}
