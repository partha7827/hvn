import 'package:highvibe/modules/explore/explore_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/explore/explore_page.dart';

class ExploreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ExploreController()),
      ];

  @override
  List<Router> get routers => [
        Router("/explore", child: (_, args) => ExplorePage()),
      ];

  static Inject get to => Inject<ExploreModule>.of();
}
