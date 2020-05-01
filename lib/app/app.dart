import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/auth_module.dart';
import 'package:highvibe/app/auth/auth_repository.dart';
import 'package:highvibe/app/auth/login/login_controller.dart';
import 'package:highvibe/app/auth/login/login_page.dart';
import 'package:highvibe/app/auth/user_repository.dart';
import 'package:highvibe/app/home/home_module.dart';
import 'package:highvibe/app/home/home_page.dart';
import 'package:highvibe/app/firebase_repository.dart';
import 'package:highvibe/app/blockchain_repository.dart';
import 'package:highvibe/app/getstream_repository.dart';
import 'package:highvibe/app/agora_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/app/profile/profile_module.dart';
import 'package:highvibe/widgets/splash_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseRepository()),
        Bind((i) => BlockchainRepository()),
        Bind((i) => GetstreamRepository()),
        Bind((i) => AgoraRepository()),
        Bind((i) => AuthController()),
        Bind((i) => AuthRepository()),
        Bind((i) => UserRepository()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router("", module: AuthModule()),
        Router("", module: HomeModule()),
        Router("", module: ProfileModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'HighVibe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
