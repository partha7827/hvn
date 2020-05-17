import 'package:highvibe/modules/community/community_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/community/community_page.dart';

class CommunityModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CommunityController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CommunityPage()),
      ];

  static Inject get to => Inject<CommunityModule>.of();
}
