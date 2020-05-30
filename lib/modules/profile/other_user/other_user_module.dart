import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/other_user/other_user_controller.dart';
import 'package:highvibe/modules/profile/other_user/other_user_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

class OtherUserModule extends WidgetModule {
  final User user;

  OtherUserModule(this.user);

  @override
  List<Bind<Object>> get binds => [
        Bind<OtherUserController>((_) => OtherUserController(user),
            singleton: false),
        Bind<FirestoreService>((_) => FirestoreService.withFirebase()),
        Bind<AuthService>((_) => AuthService.withFirebase()),
        Bind<AppController>((_) => AppController()),
      ];

  @override
  Widget get view => const OtherUserPage();
}
