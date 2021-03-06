import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'show_playlists_controller.dart';
import 'show_playlists_page.dart';

class ShowPlaylistsModule extends WidgetModule {
  final String userId;

  ShowPlaylistsModule({@required this.userId});

  @override
  List<Bind<Object>> get binds => [
        Bind<FirestorePlaylistService>(
          (_) => FirestorePlaylistService(
            userId: userId,
          ),
        ),
        Bind((i) => ShowPlaylistsController()),
      ];

  @override
  Widget get view => const ShowPlaylistsPage();
}
