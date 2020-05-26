import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<AppStore>((i) => AppStore()),
        Bind<HomeController>((i) => HomeController()),
        Bind<AuthService>((i) => AuthService.withFirebase()),
        Bind<StoreService>((i) => StoreService.withFirebase()),
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

  static Future toHome() =>
      Modular.to.pushNamedAndRemoveUntil(HOME, (_) => false);
}
