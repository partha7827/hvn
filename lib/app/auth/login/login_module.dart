import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
