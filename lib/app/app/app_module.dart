import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/app/app_widget.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/auth_module.dart';
import 'package:highvibe/app/home/home_module.dart';
import 'package:highvibe/app/profile/profile_module.dart';
import 'package:highvibe/app/wallet/wallet_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router("", module: AuthModule()),
        Router("", module: HomeModule()),
        Router("", module: ProfileModule()),
        Router("", module: WalletModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
