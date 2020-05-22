
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/app/app_widget.dart';
import 'package:highvibe/modules/audio_player/audio_player_module.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/video_player/video_player_module.dart';

import 'package:highvibe/modules/wallet/wallet_module.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';

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
        Router("", module: AudioPlayerModule()),
        Router("", module: VideoPlayerModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
