import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:mobx/mobx.dart';

part 'auto_login_controller.g.dart';

class AutoLoginController = _AutoLoginControllerBase with _$AutoLoginController;

abstract class _AutoLoginControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();

  final FirestoreService firestore = Modular.get<FirestoreService>();

  final AppController appStore = Modular.get<AppController>();

  @action
  Future<void> init() async {
    try {
      final uid = await auth.getUid();

      if (uid == null) throw LoginException(Strings.userNotFound);

      final user = await firestore.userCollection.document(uid).get();

      if (!user.exists) throw LoginException(Strings.userNotFound);

      await appStore.setCurrentUser(User.fromSnapshot(user));
    } catch (_) {
      await appStore.setCurrentUser(null);
    }
  }
}
