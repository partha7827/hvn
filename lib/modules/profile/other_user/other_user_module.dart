import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/models.dart';
import 'package:hvn/modules/app/app_store.dart';
import 'package:hvn/modules/profile/other_user/other_user_controller.dart';
import 'package:hvn/modules/profile/other_user/other_user_page.dart';
import 'package:hvn/services/auth_service.dart';
import 'package:hvn/services/store_service.dart';

class OtherUserModule extends WidgetModule {
  final User user;
  
  OtherUserModule(this.user);

  @override
  List<Bind> get binds => [
    Bind<OtherUserController>((_) => OtherUserController(user), singleton: false),
    Bind<StoreService>((_) => StoreService.withFirebase()),
    Bind<AuthService>((_) => AuthService.withFirebase()),
    Bind<AppStore>((_) => AppStore()),
  ];

  @override
  Widget get view => OtherUserPage();
}