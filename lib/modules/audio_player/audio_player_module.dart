import 'package:hvn/models/audio/audio.dart';
import 'package:hvn/modules/audio_player/audio_player_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/audio_player/audio_player_page.dart';
import 'package:hvn/modules/audio_player/audio_player_service.dart';

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
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future toPlayer(Audio audio) =>
      Modular.to.pushNamed("/audioplayer", arguments: audio);
}
