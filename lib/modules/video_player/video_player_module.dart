import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';

class VideoPlayerModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(
          "/videoplayer",
          child: (_, args) => VideoPlayerPage(video: args.data),
        ),
      ];

  static Future toPlayer(Video video) =>
      Modular.to.pushNamed("videoplayer", arguments: video);
}
