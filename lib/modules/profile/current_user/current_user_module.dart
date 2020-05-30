import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/current_user/current_user_controller.dart';
import 'package:highvibe/modules/profile/current_user/current_user_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

class CurrentUserModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind<CurrentUserController>((_) => CurrentUserController(),
            singleton: false),
        Bind<FirestoreService>((_) => FirestoreService.withFirebase()),
        Bind<AuthService>((_) => AuthService.withFirebase()),
        Bind<AppController>((_) => AppController()),
      ];

  @override
  Widget get view => const CurrentUserPage();
}
