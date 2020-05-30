import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/discover_controller.dart';
import 'package:highvibe/modules/discover/discover_page.dart';
import 'package:highvibe/services/firestore_service.dart';

class DiscoverModule extends ChildModule {
  static const discover = '/discover';

  @override
  List<Bind> get binds => [
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
        Bind<DiscoverController>((i) => DiscoverController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          discover,
          child: (_, args) => DiscoverPage(pageIndex: args.data),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future toDiscover({int pageIndex}) =>
      Modular.to.pushNamed(discover, arguments: pageIndex);

  static Future toDiscoverAudios() =>
      Modular.to.pushNamed(discover, arguments: 0);

  static Future toDiscoverVideos() =>
      Modular.to.pushNamed(discover, arguments: 1);

  static Future toDiscoverAuthors() =>
      Modular.to.pushNamed(discover, arguments: 1);
}
