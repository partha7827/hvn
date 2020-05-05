import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/services/user_service.dart';
import 'package:mobx/mobx.dart';

part 'other_user_controller.g.dart';

class OtherUserController = _OtherUserControllerBase with _$OtherUserController;

abstract class _OtherUserControllerBase with Store {
  final userService = Modular.get<UserService>();

  @observable
  String otherUserId;

  @observable
  User otherUser;

  @action
  Future<void> init(String userId) async {
    otherUserId = userId;
    otherUser = await userService.fetchUserData(userId);
  }

  User get currentUser => Modular.get<AuthController>().currentUser;

  @computed
  bool get isFollowing => currentUser.following.contains(otherUserId);

  @action
  Future<void> followUser(userId) async {
    if (isFollowing) {
      currentUser.following.remove(userId);
      otherUser.followers.remove(currentUser.id);
      await userService.unfollowUser(currentUser.id, userId);
    } else {
      currentUser.following.add(userId);
      otherUser.followers.add(currentUser.id);
      await userService.followUser(currentUser.id, userId);
    }
  }
}
