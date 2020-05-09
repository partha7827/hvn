import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:mobx/mobx.dart';

part 'other_user_controller.g.dart';

class OtherUserController = _OtherUserControllerBase with _$OtherUserController;

abstract class _OtherUserControllerBase with Store {
  final store = Modular.get<StoreService>();

  @observable
  String otherUserId;

  @observable
  User otherUser;

  @action
  Future<void> init(String userId) async {
    otherUserId = userId;
    otherUser = await store.fetchUserData(userId);
  }

  User get currentUser => Modular.get<CurrentUserStore>().currentUser;

  @computed
  bool get isFollowing => currentUser.following.contains(otherUserId);

  @action
  Future<void> followUser(userId) async {
    if (isFollowing) {
      currentUser.following.toList().remove(userId);
      otherUser.followers.toList().remove(currentUser.id);
      await store.unfollowUser(currentUser.id, userId);
    } else {
      currentUser.following.toList().add(userId);
      otherUser.followers.toList().add(currentUser.id);
      await store.followUser(currentUser.id, userId);
    }
  }
}
