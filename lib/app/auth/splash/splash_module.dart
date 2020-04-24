import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/splash/splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
