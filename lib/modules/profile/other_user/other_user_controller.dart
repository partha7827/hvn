import 'package:cloud_firestore/cloud_firestore.dart' show FieldValue;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'other_user_controller.g.dart';

class OtherUserController = _OtherUserControllerBase with _$OtherUserController;

abstract class _OtherUserControllerBase with Store {
  final store = Modular.get<StoreService>();
  User get currentUser => Modular.get<AppStore>().currentUser;
  String get currentUserId => currentUser.id;

  final String otherUserId;
  _OtherUserControllerBase(this.otherUserId);

  @action
  Future<void> loadOtherUser() async {
    final userFuture = store.userCollection
        .document(otherUserId)
        .get()
        .then((s) => User.fromSnapshot(s));

    otherUserFuture = ObservableFuture(userFuture);
    otherUser = await userFuture;

    followers = ObservableList.of(otherUser.followers);
    following = ObservableList.of(otherUser.following);
  }

  User otherUser;

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

      await store.userCollection.document(currentUser.id).updateData({
        "following": FieldValue.arrayRemove([otherUserId])
      });

      await store.userCollection.document(otherUserId).updateData({
        "followers": FieldValue.arrayRemove([currentUser.id])
      });
    } else {
      followers.add(currentUserId);

      await store.userCollection.document(currentUser.id).updateData({
        "following": FieldValue.arrayUnion([otherUserId])
      });

      await store.userCollection.document(otherUserId).updateData({
        "followers": FieldValue.arrayUnion([currentUser.id])
      });
    }
  }
}
