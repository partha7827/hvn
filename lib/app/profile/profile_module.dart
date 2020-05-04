import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/profile/audio/audio_controller.dart';
import 'package:highvibe/app/profile/broadcast/broadcast_controller.dart';
import 'package:highvibe/app/profile/broadcast/broadcast_page.dart';
import 'package:highvibe/app/profile/chat/chat_controller.dart';
import 'package:highvibe/app/profile/chat/chat_page.dart';
import 'package:highvibe/app/profile/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/profile/profile_page.dart';
import 'package:highvibe/services/user_service.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProfileController()),
        Bind((i) => AuthController()),
        Bind((i) => UserService()),
        Bind((i) => AudioController()),
        Bind((i) => ChatController()),
        Bind((i) => BroadcastController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          PROFILE,
          child: (_, args) => ProfilePage(),
          transition: TransitionType.noTransition,
        ),
        Router("/chat", child: (_, args) => ChatPage()),
        Router("/broadcast", child: (_, args) => BroadcastPage()),
      ];

  static Inject get to => Inject<ProfileModule>.of();

  static const PROFILE = "/profile";

  static Future toProfile() =>
      Modular.to.pushNamedAndRemoveUntil(PROFILE, (_) => false);
}
