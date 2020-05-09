import 'package:highvibe/app/audio_player/audio_player_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/audio_player_page.dart';
import 'package:highvibe/app/audio_player/audio_player_service.dart';

class AudioPlayerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AudioPlayerController()),
        Bind((i) => AudioPlayerService(audioFile: i.args.data)),
      ];

  @override
  List<Router> get routers => [
        Router(
          "/audioplayer",
          child: (_, args) => AudioPlayerPage(audioFile: args.data),
          transition: TransitionType.scale,
        ),
      ];

  static Inject get to => Inject<AudioPlayerModule>.of();
}
