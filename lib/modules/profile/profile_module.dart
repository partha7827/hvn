import 'package:highvibe/modules/profile/current_user/current_user_module.dart';
import 'package:highvibe/modules/profile/other_user/other_user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(
          profileRoute,
          child: (_, args) => CurrentUserModule(),
          transition: TransitionType.noTransition,
        ),
        Router(
          "$profileRoute/:userId",
          child: (_, args) => OtherUserModule(args.params['userId']),
        ),
        // Router("/chat", child: (_, args) => ChatPage()),
        // Router("/broadcast", child: (_, args) => BroadcastPage()),
        // Router("/live/:userId",
        //     child: (_, args) => LivePage(userId: args.params['userId'])),
      ];

  static String profileRoute = "/profile";

  static Inject get to => Inject<ProfileModule>.of();

  static Future toProfile() => Modular.to.pushNamed(profileRoute);

  static Future toOtherProfile(String userId) => Modular.to.pushNamed(
        "$profileRoute/$userId",
        // (route) => (route.settings.name ?? '').startsWith(profileRoute),
      );

  static void toHome() => Modular.to.pop();
}
