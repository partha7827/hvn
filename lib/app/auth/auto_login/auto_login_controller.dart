import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:mobx/mobx.dart';

part 'auto_login_controller.g.dart';

class AutoLoginController = _AutoLoginControllerBase with _$AutoLoginController;

abstract class _AutoLoginControllerBase with Store {
  final currentUserStore = Modular.get<CurrentUserStore>();

  @action
  Future<void> init() async {
    when((_) => currentUserStore.authState == AuthState.unauthenticated, () {
      Modular.to.pushReplacementNamed("/login");
    });

    when((_) => currentUserStore.authState == AuthState.authenticated, () {
      Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
    });

    currentUserStore.init();
  }
}
