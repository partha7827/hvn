import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final authController = Modular.get<AuthController>();

  get currentUser => authController.currentUser.toString();

  @action
  Future<void> logout() async {
    await authController.logout();

    Modular.to.pushNamedAndRemoveUntil("/", (_) => false);
  }
}
