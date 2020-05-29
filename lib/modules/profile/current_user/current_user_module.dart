import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/app/app_store.dart';
import 'package:hvn/modules/profile/current_user/current_user_controller.dart';
import 'package:hvn/modules/profile/current_user/current_user_page.dart';
import 'package:hvn/services/auth_service.dart';
import 'package:hvn/services/store_service.dart';

class CurrentUserModule extends WidgetModule {
  @override
  List<Bind> get binds => [
    Bind<CurrentUserController>((_) => CurrentUserController(), singleton: false),
    Bind<StoreService>((_) => StoreService.withFirebase()),
    Bind<AuthService>((_) => AuthService.withFirebase()),
    Bind<AppStore>((_) => AppStore()),
  ];

  @override
  Widget get view => CurrentUserPage();
}