import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'current_user_controller.g.dart';

class CurrentUserController = _CurrentUserControllerBase
    with _$CurrentUserController;

abstract class _CurrentUserControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService store = Modular.get<FirestoreService>();
  final AppController currentUserStore = Modular.get<AppController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  User get currentUser => currentUserStore.currentUser;

  @action
  Future<void> init() async {
    when((_) => currentUserStore.authState == AuthState.unauthenticated, () {
      Modular.to.pushReplacementNamed('/login');
    });
  }

  @action
  Future<void> updateUserInfo() async {
    final name = nameController.text;
    final status = statusController.text;
    if (name == currentUser.name && status == currentUser.status) {
      return;
    }
    currentUser.rebuild((b) => b
      ..name = name
      ..status = status);
    try {
      await store.userCollection
          .document(currentUser.id)
          .updateData(serializers.deserialize(currentUser));
    } catch (e) {
      showSnackBarMsg(scaffoldKey.currentState, e.toString());
    }
  }

  @action
  Future<void> changeProfilePic() async {
    // ignore: deprecated_member_use
    final img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      try {
        final url = await uploadFile(img, 'avatar');
        currentUser.rebuild((b) => b..photoUrl = url);

        await store.userCollection
            .document(currentUser.id)
            .updateData(serializers.deserialize(currentUser));
      } catch (e) {
        showSnackBarMsg(scaffoldKey.currentState, e.toString());
      }
    }
  }

  @action
  Future<void> logout() async {
    await auth.logout();
    await currentUserStore.setCurrentUser(null);
  }
}
