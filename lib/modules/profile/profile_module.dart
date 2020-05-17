import 'package:highvibe/modules/live/live_page.dart';
import 'package:highvibe/modules/profile/current_user/current_user_controller.dart';
import 'package:highvibe/modules/profile/live/live_controller.dart';
import 'package:highvibe/modules/profile/audio/audio_controller.dart';
import 'package:highvibe/modules/profile/broadcast/broadcast_controller.dart';
import 'package:highvibe/modules/profile/broadcast/broadcast_page.dart';
import 'package:highvibe/modules/profile/chat/chat_controller.dart';
import 'package:highvibe/modules/profile/chat/chat_page.dart';
import 'package:highvibe/modules/profile/current_user/current_user_page.dart';
import 'package:highvibe/modules/profile/other_user/other_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AudioController()),
        Bind((i) => BroadcastController()),
        Bind((i) => ChatController()),
        Bind((i) => CurrentUserController()),
        Bind((i) => LiveController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          profileRoute,
          child: (_, args) => CurrentUserPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          "$profileRoute/:userId",
          child: (_, args) => OtherUserPage(userId: args.params['userId']),
        ),
        Router("/chat", child: (_, args) => ChatPage()),
        Router("/broadcast", child: (_, args) => BroadcastPage()),
        Router("/live/:userId",
            child: (_, args) => LivePage(userId: args.params['userId'])),
      ];

  static String profileRoute = "/profile";

  static Inject get to => Inject<ProfileModule>.of();

  static Future toProfile() =>
      Modular.to.pushNamedAndRemoveUntil(profileRoute, (_) => false);

  static Future toOtherProfile(String userId) =>
      Modular.to.pushNamedAndRemoveUntil(
        "$profileRoute/:$userId",
        (route) => (route.settings.name ?? '').startsWith(profileRoute),
      );
}
