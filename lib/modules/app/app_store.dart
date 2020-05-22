import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final auth = Modular.get<AuthService>();

  final firestore = Modular.get<StoreService>();

  @observable
  AuthState authState = AuthState.initial;

  @observable
  User currentUser;

  @action
  Future<void> setCurrentUser(User user) async {
    if (user != null) {
      currentUser = user;

      _setAuthenticated(true);
      await _setUserOnline(true);
    } else {
      _setAuthenticated(false);
      await _setUserOnline(false);
    }
  }

  void _setAuthenticated(bool isAuthenticated) {
    if (isAuthenticated) {
      authState = AuthState.authenticated;
    } else {
      authState = AuthState.unauthenticated;
    }
  }

  _setUserOnline(bool active) {
    if (currentUser != null) {
      firestore.userCollection.document(currentUser.id).updateData({
        "isOnline": active,
        // "lastTimeSeen": serializers.serialize(DateTime.now().toUtc())
      });
    }
  }
}
