import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'current_user_controller.g.dart';

class CurrentUserController = _CurrentUserControllerBase
    with _$CurrentUserController;

abstract class _CurrentUserControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService store = Modular.get<FirestoreService>();
  final AppController app = Modular.get<AppController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  User get currentUser => app.currentUser;

  @action
  Future<void> logout() async {
    await auth.logout();
    await app.setCurrentUser(null);
  }
}
