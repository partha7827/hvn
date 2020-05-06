import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/models/models.dart';

import 'package:highvibe/services/user_service.dart';
import 'package:highvibe/store/current_user_store.dart';
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

  User get currentUser => Modular.get<CurrentUserStore>().currentUser;

  @computed
  bool get isFollowing => currentUser.following.contains(otherUserId);

  @action
  Future<void> followUser(userId) async {
    if (isFollowing) {
      currentUser.following.toList().remove(userId);
      otherUser.followers.toList().remove(currentUser.id);
      await userService.unfollowUser(currentUser.id, userId);
    } else {
      currentUser.following.toList().add(userId);
      otherUser.followers.toList().add(currentUser.id);
      await userService.followUser(currentUser.id, userId);
    }
  }
}
