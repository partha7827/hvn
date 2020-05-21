import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';
import 'package:highvibe/modules/video_player/video_player_strore.dart';

class VideoPlayerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VideoPlayerStore()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/videoplayer',
          transition: TransitionType.custom,
          customTransition: _videoPlayerTransition,
          // routeGenerator: (builder, settings) => VideoPageRoute(
          //   builder: builder,
          //   settings: settings,
          // ),
          child: (_, args) => VideoPlayerPage(video: args.data),
        ),
      ];

  static Inject get to => Inject<VideoPlayerModule>.of();
}

CustomTransition get _videoPlayerTransition => CustomTransition(
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
    );
