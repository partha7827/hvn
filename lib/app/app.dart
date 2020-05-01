import 'package:highvibe/app/auth/auth_module.dart';
import 'package:highvibe/app/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:highvibe/app/profile/profile_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => FirebaseService()),
        // Bind((i) => BlockchainService()),
        // Bind((i) => GetstreamService()),
        // Bind((i) => AgoraService()),
        // Bind((i) => AuthController()),
        // Bind((i) => AuthRepository()),
        // Bind((i) => UserRepository()),
        // Bind((i) => LoginController()),
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
