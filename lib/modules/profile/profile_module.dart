import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/profile/current_user/current_user_module.dart';
import 'package:highvibe/modules/profile/other_user/other_user_module.dart';
import 'package:highvibe/modules/profile/users_list/users_list_module.dart';
import 'package:highvibe/widgets/image_viewer.dart';

class ProfileModule extends ChildModule {
  static String profileRoute = '/profile';

  static Inject get to => Inject<ProfileModule>.of();

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
          '$profileRoute/user/:userId',
          child: (_, args) => OtherUserModule(args.data),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$profileRoute/followers',
          child: (_, args) =>
              UsersListModule(userIds: args.data, title: 'Followers'),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$profileRoute/following',
          child: (_, args) =>
              UsersListModule(userIds: args.data, title: 'Following'),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$profileRoute/avatar',
          child: (_, args) => ImageViewer(arguments: args.data),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Future toAvatarPicture(ImageViewerArguments arguments) =>
      Modular.to.pushNamed('$profileRoute/avatar', arguments: arguments);

  static Future toFollowers(List<String> followers) =>
      Modular.to.pushNamed('$profileRoute/followers', arguments: followers);

  static Future toFollowing(List<String> following) =>
      Modular.to.pushNamed('$profileRoute/following', arguments: following);

  static void toHome() => Modular.to.pop();

  static Future toOtherProfile(User user) => Modular.to.pushNamedAndRemoveUntil(
      '$profileRoute/user/${user.id}',
      (route) => !(route.settings.name ?? '').startsWith(profileRoute),
      arguments: user);

  static Future toProfile() => Modular.to.pushNamed(profileRoute);
}
