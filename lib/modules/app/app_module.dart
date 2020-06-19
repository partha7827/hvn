import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/app/app_widget.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/change_theme/change_theme_module.dart';
import 'package:highvibe/modules/discover/discover_module.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/modules/journal/journal_module.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_module.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/wallet/wallet_module.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

class AppModule extends MainModule {
  static bool audioPlayerPageIsOffstage = false;

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthService.withFirebase()),
        Bind((i) => FirestoreService.withFirebase()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router('', module: AuthModule()),
        Router('', module: HomeModule()),
        Router('', module: ProfileModule()),
        Router('', module: WalletModule()),
        Router('', module: DiscoverModule()),
        Router('', module: JournalModule()),
        Router('', module: MoodTrackerModule()),
        Router('', module: PlaylistModule()),
        Router('', module: ChangeThemeModule()),
      ];

  @override
  Widget get bootstrap => const AppWidget();

  static Inject<AppModule> get to => Inject<AppModule>.of();
}
