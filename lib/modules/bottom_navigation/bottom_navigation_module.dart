import 'package:highvibe/modules/bottom_navigation/bottom_navigation_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/bottom_navigation/bottom_navigation_page.dart';

class BottomNavigationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BottomNavigationController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => BottomNavigationPage()),
      ];

  static Inject get to => Inject<BottomNavigationModule>.of();
}
