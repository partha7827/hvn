import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/app/app_store.dart';
import 'package:hvn/modules/app/app_widget.dart';
import 'package:hvn/modules/auth/auth_module.dart';
import 'package:hvn/modules/discover/discover_module.dart';
import 'package:hvn/modules/home/home_module.dart';
import 'package:hvn/modules/profile/profile_module.dart';
import 'package:hvn/modules/wallet/wallet_module.dart';
import 'package:hvn/services/auth_service.dart';
import 'package:hvn/services/store_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppStore()),
        Bind((i) => AuthService.withFirebase()),
        Bind((i) => StoreService.withFirebase()),
      ];

  @override
  List<Router> get routers => [
        Router("", module: AuthModule()),
        Router("", module: HomeModule()),
        Router("", module: ProfileModule()),
        Router("", module: WalletModule()),
        Router("", module: DiscoverModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
