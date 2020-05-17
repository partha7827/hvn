import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:mobx/mobx.dart';

part 'auto_login_controller.g.dart';

class AutoLoginController = _AutoLoginControllerBase with _$AutoLoginController;

abstract class _AutoLoginControllerBase with Store {
  final auth = Modular.get<AuthService>();

  final firestore = Modular.get<StoreService>();

  final appStore = Modular.get<AppStore>();

  @action
  Future<void> init() async {
    try {
      final uid = await auth.getUid();

      if (uid == null) throw LoginException(Strings.userNotFound);

      final user = await firestore.userCollection.document(uid).get();

      if (!user.exists) throw LoginException(Strings.userNotFound);

      appStore.setCurrentUser(User.fromSnapshot(user));
    } catch (e) {
      appStore.setCurrentUser(null);
    }
  }
}
