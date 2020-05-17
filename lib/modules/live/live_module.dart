import 'package:highvibe/modules/live/live_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/live/live_page.dart';

class LiveModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LiveController()),
      ];

  @override
  List<Router> get routers => [
        Router("/live/:userId", child: (_, args) => LivePage(userId: args.params['userId'])),
      ];

  static Inject get to => Inject<LiveModule>.of();

  static Future toLive(String userId) =>
      Modular.to.pushNamed("/live/$userId");
}
