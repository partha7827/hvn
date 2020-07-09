import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/values/strings.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();

  final FirestoreService firestore = Modular.get<FirestoreService>();
  SharedPreferences sharedPreferences;

  @observable
  AuthState authState = AuthState.initial;

  @observable
  User currentUser;

  @action
  Future<void> setCurrentUser(User user) async {
    if (user != null) {
      currentUser = user;
      await sharedPreferences?.setBool(Strings.hasPreviouslySignedUp, true);

      _setAuthenticated(true);
      _setUserOnline(true);
    } else {
      _setAuthenticated(false);
      _setUserOnline(false);
    }
  }

  void _setAuthenticated(bool isAuthenticated) {
    if (isAuthenticated) {
      authState = AuthState.authenticated;
    } else {
      authState = AuthState.unauthenticated;
    }
  }

  void _setUserOnline(bool active) {
    if (currentUser != null) {
      firestore.userCollection.document(currentUser.id).updateData({
        'isOnline': active,
        // "lastTimeSeen": serializers.serialize(DateTime.now().toUtc())
      });
    }
  }

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
