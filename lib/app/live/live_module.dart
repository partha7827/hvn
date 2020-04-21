import 'package:highvibe/app/live/live_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/live/live_page.dart';

class LiveModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LiveController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LivePage()),
      ];

  static Inject get to => Inject<LiveModule>.of();
}
