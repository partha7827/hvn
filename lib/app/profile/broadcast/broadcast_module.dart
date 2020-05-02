import 'package:highvibe/app/profile/broadcast/broadcast_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/profile/broadcast/broadcast_page.dart';

class BroadcastModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BroadcastController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BroadcastPage()),
      ];

  static Inject get to => Inject<BroadcastModule>.of();
}
