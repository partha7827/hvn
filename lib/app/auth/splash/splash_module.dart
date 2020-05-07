import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/splash/splash_page.dart';
import 'package:highvibe/store/current_user_store.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CurrentUserStore()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
