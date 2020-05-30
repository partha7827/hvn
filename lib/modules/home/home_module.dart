import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/services/firestore_service.dart';

class HomeModule extends ChildModule {
  static const home = '/home';

  @override
  List<Bind> get binds => [
        Bind<HomeController>((i) => HomeController()),
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
      ];

  @override
  List<Router> get routers => [
        Router(
          home,
          child: (_, args) => const HomePage(),
          transition: TransitionType.noTransition,
        ),
      ];

  static Future toHome() =>
      Modular.to.pushNamedAndRemoveUntil(home, (_) => false);
}
