import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_controller.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_page.dart';
import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/modules/auth/login/login_page.dart';
import 'package:highvibe/modules/auth/register/register_controller.dart';
import 'package:highvibe/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/utils/utils.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppStore()),
        // Bind((i) => FirebaseAuth.instance),
        // Bind((i) => Firestore.instance),
        Bind((i) => StoreService(getMockFirestore())),
        Bind((i) => AuthService(getMockAuth())),
        Bind((i) => AutoLoginController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
      ];

  @override
  List<Router> get routers => [
        Router('/autologin', child: (_, args) => AutoLoginPage()),
        Router('/register', child: (_, args) => RegisterPage()),
        Router('/login', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();

  static Future toRegister() => Modular.to.pushNamed('/register');

  static Future toLogin() => Modular.to.pushNamed("/login");
}
