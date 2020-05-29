import 'package:hvn/modules/discover/users/discover_users.dart';
import 'package:hvn/modules/profile/current_user/current_user_module.dart';
import 'package:hvn/modules/profile/other_user/other_user_module.dart';
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
          "$profileRoute/user/:userId",
          child: (_, args) => OtherUserModule(args.data),
        ),
        Router(
          "$profileRoute/followers",
          child: (_, args) => DiscoverFollowers(args.data),
        ),
        Router(
          "$profileRoute/following",
          child: (_, args) => DiscoverFollowing(args.data),
        ),
      ];

  static String profileRoute = "/profile";

  static Inject get to => Inject<ProfileModule>.of();

  static Future toProfile() => Modular.to.pushNamed(profileRoute);

  static Future toOtherProfile(user) => Modular.to.pushNamedAndRemoveUntil(
        "$profileRoute/user/${user.id}",
        (route) => !(route.settings.name ?? '').startsWith(profileRoute),
        arguments: user
      );

  static Future toFollowers(List<String> followers) => Modular.to
      .pushNamed("$profileRoute/followers", arguments: followers);

  static Future toFollowing(List<String> following) => Modular.to
      .pushNamed("$profileRoute/following", arguments: following);

  static void toHome() => Modular.to.pop();
}
