import 'package:highvibe/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/services/firestore_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<HomeController>((i) => HomeController()),
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
      ];

  @override
  List<Router> get routers => [
        Router(
          HOME,
          child: (_, args) => HomePage(),
          transition: TransitionType.noTransition,
        ),
      ];

  static const HOME = "/home";

  static Future toHome() =>
      Modular.to.pushNamedAndRemoveUntil(HOME, (_) => false);
}
