import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/home_page.dart';
import 'package:highvibe/modules/home/manage_content/api/firestore_audio_service.dart';
import 'package:highvibe/modules/home/manage_content/manage_content_contoller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';

class HomeModule extends ChildModule {
  static const home = '/home';
  final _currentUserStore = Modular.get<AppController>();

  @override
  List<Bind<Object>> get binds => [
        Bind<FirestoreAudioService>(
          (_) => FirestoreAudioService(
            userId: _currentUserStore.currentUser.id,
          ),
        ),
        Bind<HomeController>((i) => HomeController()),
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
        Bind<AuthService>((i) => AuthService.withFirebase()),
        Bind<AppController>((i) => AppController()),
        Bind<StorageService>((_) => StorageService.withFirebase()),
        Bind<ManageContentController>((_) => ManageContentController()),
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
