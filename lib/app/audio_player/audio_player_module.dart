import 'package:highvibe/app/audio_player/audio_player_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/audio_player_page.dart';

class AudioPlayerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AudioPlayerController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AudioPlayerPage()),
      ];

  static Inject get to => Inject<AudioPlayerModule>.of();
}
