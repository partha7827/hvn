import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_page.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';

class AddToPlaylistModule extends WidgetModule {
  final _currentUserStore = Modular.get<AppController>();

  final Audio audioFile;
  final bool isPresentedAsOverlay;

  AddToPlaylistModule({
    @required this.audioFile,
    @required this.isPresentedAsOverlay,
  });

  @override
  List<Bind<Object>> get binds => [
        Bind<FirestorePlaylistService>(
          (_) => FirestorePlaylistService(
            userId: _currentUserStore.currentUser.id,
          ),
        ),
        Bind<AddToPlaylistController>(
            (i) => AddToPlaylistController(audioFile)),
      ];

  @override
  Widget get view {
    return AddToPlaylistPage(isPresentedAsOverlay: isPresentedAsOverlay);
  }
}
