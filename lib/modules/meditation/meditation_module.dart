import 'package:highvibe/modules/meditation/meditation_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/meditation/meditation_page.dart';

class MeditationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MeditationController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MeditationPage()),
      ];

  static Inject get to => Inject<MeditationModule>.of();
}
