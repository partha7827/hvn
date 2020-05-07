import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/models/models.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'current_user_store.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class CurrentUserStore = _CurrentUserStoreBase with _$CurrentUserStore;

abstract class _CurrentUserStoreBase with Store {
  // @observable
  // bool isLive;

  // @observable
  // bool isOnline;

  // @observable
  // String name;

  // @observable
  // String status;

  // @observable
  // String info;

  // @observable
  // String playlist;

  // @observable
  // String photoUrl;

  // @observable
  // ObservableList<String> badges;

  // @observable
  // ObservableList<String> uploads;

  // @observable
  // ObservableList<String> featured;

  // @observable
  // ObservableList<String> scheduled;

  // @observable
  // int karmaPoints;

  // @observable
  // int experiencePoints;

  final auth = Modular.get<AuthService>();

  final store = Modular.get<StoreService>();

  @observable
  AuthState authState = AuthState.initial;

  @observable
  User currentUser;

  @action
  Future<void> init() async {
    try {
      final uid = await auth.getUid();

      if (uid == null) {
        authState = AuthState.unauthenticated;
      } else {
        currentUser = await store.fetchUserData(uid);

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
    currentUser = await store.fetchUserData(uid);

    authState = AuthState.authenticated;

    await setUserOnline(true);
  }

  Future<void> logout() async {
    await setUserOnline(false);

    await auth.logout();

    authState = AuthState.unauthenticated;

    currentUser = null;
  }

  Future<void> setUserOnline(bool active) =>
      store.setUserActive(currentUser.id, active);
}
