import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/meditation/meditation_controller.dart';
import 'package:highvibe/modules/meditation/meditation_page.dart';

class MeditationModule extends ChildModule {
  static Inject<MeditationModule> get to => Inject<MeditationModule>.of();

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => MeditationController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => const MeditationPage()),
      ];
}
