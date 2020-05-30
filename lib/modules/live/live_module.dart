import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/live/live_controller.dart';
import 'package:highvibe/modules/live/live_page.dart';

class LiveModule extends ChildModule {
  static Inject<LiveModule> get to => Inject<LiveModule>.of();
  String userId;

  LiveModule(this.userId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => LiveController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router('/', child: (_, args) => LivePage(userId)),
        Router('/live/:userId',
            child: (_, args) => LivePage(args.params['userId'])),
      ];

  static Future<Object> toLive(String userId) =>
      Modular.to.pushNamed('/live/$userId');
}
