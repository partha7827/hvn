import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:mobx/mobx.dart';

part 'login_register_controller.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class LoginRegisterController = _LoginRegisterControllerBase
    with _$LoginRegisterController;

abstract class _LoginRegisterControllerBase with Store {
  void toLogin() {
    AuthModule.toLogin();
  }

  void toRegister() {
    AuthModule.toRegister();
  }

  void skipAndExplore() {
    // Skip and explore
  }
}
