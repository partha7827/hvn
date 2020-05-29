import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/models.dart' show User;
import 'package:hvn/modules/app/app_store.dart';
import 'package:hvn/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'other_user_controller.g.dart';

class OtherUserController = _OtherUserControllerBase with _$OtherUserController;

abstract class _OtherUserControllerBase with Store {
  final store = Modular.get<StoreService>();
  User get currentUser => Modular.get<AppStore>().currentUser;
  String get currentUserId => currentUser.id;

  final User otherUser;
  _OtherUserControllerBase(this.otherUser) {
    followers = ObservableList.of(otherUser.followers);
    following = ObservableList.of(otherUser.following);
  }

  @observable
  ObservableFuture<User> otherUserFuture;

  @observable
  ObservableList<String> followers = ObservableList.of([]);

  @observable
  ObservableList<String> following = ObservableList.of([]);

  @computed
  bool get isFollowing => followers.contains(currentUserId);

  @action
  Future<void> followUser() async {
    if (isFollowing) {
      followers.remove(currentUserId);
      store.unfollow(currentUser.id, otherUser.id);
    } else {
      followers.add(currentUserId);
      store.follow(currentUser.id, otherUser.id);
    }
  }
}
