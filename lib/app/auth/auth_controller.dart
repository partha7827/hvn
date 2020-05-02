import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/user_service.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final authRepo = Modular.get<AuthService>();
  final userRepo = Modular.get<UserService>();

  @observable
  AuthState authState = AuthState.initial;

  @observable
  User currentUser;

  @action
  Future<void> init() async {
    try {
      final uid = await authRepo.getUid();

      if (uid == null) {
        authState = AuthState.unauthenticated;
      } else {
        currentUser = await userRepo.fetchUserData(uid);

        if (currentUser == null) {
          authState = AuthState.unauthenticated;
        } else {
          await setUserOnline(true);

          authState = AuthState.authenticated;
        }
      }
    } catch (e) {
      authState = AuthState.unauthenticated;
    }
  }

  Future<void> login(String uid) async {
    currentUser = await userRepo.fetchUserData(uid);

    authState = AuthState.authenticated;

    await setUserOnline(true);
  }

  Future<void> logout() async {
    await setUserOnline(false);

    await authRepo.logout();

    authState = AuthState.unauthenticated;

    currentUser = null;
  }

  Future<void> setUserOnline(bool active) =>
      userRepo.setUserActive(currentUser.id, active);
}

enum AuthState { initial, authenticated, unauthenticated }
