import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/routes/transparent_route.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';
import 'package:highvibe/modules/video_player/video_player_strore.dart';

class VideoPlayerModule extends ChildModule {
  static Inject get to => Inject<VideoPlayerModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => VideoPlayerStore()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/videoplayer',
          pageRouteGenerator: (builder, settings) => TransparentRoute(
            builder: builder,
            settings: settings,
          ),
          child: (_, args) => VideoPlayerPage(video: args.data),
        ),
      ];
}
