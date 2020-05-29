import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/discover/discover_controller.dart';
import 'package:hvn/modules/discover/discover_page.dart';
import 'package:hvn/services/store_service.dart';

class DiscoverModule extends ChildModule {
  static const DISCOVER = '/discover';

  @override
  List<Bind> get binds => [
        Bind<StoreService>((i) => StoreService.withFirebase()),
        Bind<DiscoverController>((i) => DiscoverController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          DISCOVER,
          child: (_, args) => DiscoverPage(
            pageIndex: args.data,
          ),
        ),
      ];

  static Future toDiscover({int pageIndex}) => Modular.to.pushNamed(
        DISCOVER,
        arguments: pageIndex,
      );
}
