import 'package:built_collection/built_collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'discover_authors_controller.g.dart';

class DiscoverAuthorsController = _DiscoverAuthorsController
    with _$DiscoverAuthorsController;

abstract class _DiscoverAuthorsController with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController app = Modular.get<AppController>();

  User get currentUser => app.currentUser;

  @observable
  ObservableFuture<BuiltList<User>> authors;

  @observable
  ObservableMap<String, int> numberOfFollowers = ObservableMap.of({});

  @observable
  ObservableMap<String, bool> isFollowing = ObservableMap.of({});

  @action
  void loadAuthors() {
    authors = ObservableFuture(
      firestore.userCollection
          // .where("tags", arrayContains: "author")
          .where('isAuthor', isEqualTo: true)
          .getDocuments()
          .then((s) => User.parseListOfUsers(s)),
    );

    authors.whenComplete(() {
      isFollowing = Map.fromEntries(
        authors.value.map(
          (user) => MapEntry(
            user.id,
            currentUser.following.contains(user.id),
          ),
        ),
      );

      numberOfFollowers = Map.fromEntries(
        authors.value.map(
          (user) => MapEntry(
            user.id,
            user.followers.length,
          ),
        ),
      );
    });
  }

  @action
  void followUser(String userId) {
    final alreadyFollowing = isFollowing[userId] == true;

    if (alreadyFollowing) {
      numberOfFollowers[userId] =
          numberOfFollowers[userId] == null ? 0 : numberOfFollowers[userId]--;
      isFollowing[userId] = false;
      firestore.unfollow(currentUser.id, userId);
    } else {
      numberOfFollowers[userId] =
          numberOfFollowers[userId] == null ? 1 : numberOfFollowers[userId]++;
      isFollowing[userId] = true;
      firestore.follow(currentUser.id, userId);
    }
  }
}
