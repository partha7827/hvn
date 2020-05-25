import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/profile/other_user/other_user_controller.dart';
import 'package:highvibe/modules/profile/other_user/other_user_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';

class OtherUserModule extends WidgetModule {
  final String userId;
  
  OtherUserModule(this.userId);

  @override
  List<Bind> get binds => [
    Bind<OtherUserController>((_) => OtherUserController(userId), singleton: false),
    Bind<StoreService>((_) => StoreService.withFirebase()),
    Bind<AuthService>((_) => AuthService.withFirebase()),
    Bind<AppStore>((_) => AppStore()),
  ];

  @override
  Widget get view => OtherUserPage(userId: userId);
}