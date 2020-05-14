import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'current_user_store.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class CurrentUserStore = _CurrentUserStoreBase with _$CurrentUserStore;

abstract class _CurrentUserStoreBase with Store {
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
        currentUser =
            User.fromSnapshot(await store.userCollection.document(uid).get());

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
    currentUser = User.fromSnapshot(await store.userCollection.document(uid).get());

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
      store.userCollection.document(currentUser.id).updateData({
        "isOnline": active,
        "lastTimeSeen": serializers.serialize(DateTime.now())
      });
}
