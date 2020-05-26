import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'discover_users_controller.g.dart';

class DiscoverUsersController = _DiscoverUsersController
    with _$DiscoverUsersController;

abstract class _DiscoverUsersController with Store {
  final store = Modular.get<StoreService>();
  final app = Modular.get<AppStore>();

  User get currentUser => app.currentUser;

  final List<String> userIds;
  _DiscoverUsersController({this.userIds = null});

  @action
  Future<void> loadUsers() async {
    Query query;
    if (userIds != null) {
      query = store.userCollection.limit(100).where("id", whereIn: userIds);
    } else {
      query = store.userCollection.limit(100);
    }

    print(query);

    usersFuture = ObservableFuture(
      query.getDocuments().then((s) => User.parseListOfUsers(s)),
    );

    await usersFuture;

    users.forEach((user) {
      isFollowing[user.id] = currentUser.following.contains(user.id);
      numberOfFollowers[user.id] = user.followers.length;
    });

    users = usersFuture.value;
  }

  @action
  void followUser(String userId) {
    bool alreadyFollowing = isFollowing[userId] == true;

    if (alreadyFollowing) {
      numberOfFollowers[userId] =
          numberOfFollowers[userId] == null ? 0 : numberOfFollowers[userId]--;
      isFollowing[userId] = false;
      store.unfollow(currentUser.id, userId);
    } else {
      numberOfFollowers[userId] =
          numberOfFollowers[userId] == null ? 1 : numberOfFollowers[userId]++;
      isFollowing[userId] = true;
      store.follow(currentUser.id, userId);
    }
  }

  BuiltList<User> users = BuiltList.of([]);

  @observable
  ObservableFuture<BuiltList<User>> usersFuture;

  @observable
  ObservableMap<String, int> numberOfFollowers = ObservableMap.of({});

  @observable
  ObservableMap<String, bool> isFollowing = ObservableMap.of({});
}
