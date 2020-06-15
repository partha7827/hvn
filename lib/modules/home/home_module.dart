import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

class HomeModule extends ChildModule {
  static const home = '/home';

  @override
  List<Bind<Object>> get binds => [
        Bind<HomeController>((i) => HomeController()),
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
        Bind<AuthService>((i) => AuthService.withFirebase()),
        Bind<AppController>((i) => AppController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(
          home,
          child: (_, args) => const HomePage(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future<Object> toHome() =>
      Modular.to.pushNamedAndRemoveUntil(home, (_) => false);
}
