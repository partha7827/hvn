import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final authController = Modular.get<CurrentUserStore>();

  get currentUser => authController.currentUser.toString();

  @action
  Future<void> logout() async {
    await authController.logout();

    Modular.to.pushNamedAndRemoveUntil("/", (_) => false);
  }
}
