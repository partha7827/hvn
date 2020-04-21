import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/app/auth/auth_repository.dart';
import 'package:highvibe/app/auth/user_repository.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => User()),
        Bind((i) => AuthRepository()),
        Bind((i) => UserRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AuthPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}