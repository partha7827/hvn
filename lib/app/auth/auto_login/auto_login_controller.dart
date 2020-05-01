import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'auto_login_controller.g.dart';

class AutoLoginController = _AutoLoginControllerBase with _$AutoLoginController;

abstract class _AutoLoginControllerBase with Store {
  final authController = Modular.get<AuthController>();

  @action
  Future<void> init() async {
    when((_) => authController.authState == AuthState.unauthenticated, () {
      Modular.to.pushReplacementNamed("/login");
    });

    when((_) => authController.authState == AuthState.authenticated, () {
      Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
    });

    authController.init();
  }
}
