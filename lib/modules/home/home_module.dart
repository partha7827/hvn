import 'package:highvibe/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          HOME,
          child: (_, args) => HomePage(),
          transition: TransitionType.noTransition,
        ),
      ];

  // static Inject get to => Inject<HomeModule>.of();

  static const HOME = "/home";

  static Future toHome() => Modular.to.pushNamedAndRemoveUntil(HOME, (_) => false);
}
