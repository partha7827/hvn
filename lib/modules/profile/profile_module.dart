import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/profile/current_user/current_user_module.dart';
import 'package:highvibe/modules/profile/edit_profile.dart';
import 'package:highvibe/modules/profile/other_user/other_user_module.dart';
import 'package:highvibe/modules/profile/users_list/users_list_module.dart';
import 'package:highvibe/widgets/image_viewer.dart';

class ProfileModule extends ChildModule {
  static String profileRoute = '/profile';

  static Inject<ProfileModule> get to => Inject<ProfileModule>.of();

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<Router<Object>> get routers => [
        Router(
          profileRoute,
          child: (_, args) => CurrentUserModule(),
          transition: TransitionType.noTransition,
        ),
        Router(
          '$profileRoute/user/:userId',
          child: (_, args) => OtherUserModule(
            userId: args.params['userId'],
            user: args.data,
          ),
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
        Router(
          'editProfile',
          child: (_, args) => EditProfile(),
        ),
      ];

  static Future<Object> toAvatarPicture(ImageViewerArguments arguments) =>
      Modular.to.pushNamed('$profileRoute/avatar', arguments: arguments);

  static Future<Object> toFollowers(List<String> followers) =>
      Modular.to.pushNamed('$profileRoute/followers', arguments: followers);

  static Future<Object> toFollowing(List<String> following) =>
      Modular.to.pushNamed('$profileRoute/following', arguments: following);

  static void toHome() => Modular.to.pop();

  static Future<Object> toOtherProfile(User user) =>
      Modular.to.pushNamedAndRemoveUntil('$profileRoute/user/${user.id}',
          (route) => !(route.settings.name ?? '').startsWith(profileRoute),
          arguments: user);

  static Future<Object> toOtherProfileId(String userId) =>
      Modular.to.pushNamedAndRemoveUntil(
        '$profileRoute/user/$userId',
        (route) => !(route.settings.name ?? '').startsWith(profileRoute),
      );

  static Future<Object> toProfile() => Modular.to.pushNamed(profileRoute);
}
