import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final appStore = Modular.get<AppStore>();
  
  final authService = Modular.get<AuthService>();

  get currentUser => appStore.currentUser.toString();

  @action
  Future<void> logout() async {
    await authService.logout();

    appStore.setCurrentUser(null);
  }
}
