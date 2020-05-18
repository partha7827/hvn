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

  @observable
  String otherUserId;

  @observable
  User otherUser;

  @action
  Future<void> init(String userId) async {
    otherUserId = userId;
    final snapshot = await store.userCollection.document(otherUserId).get();
    otherUser = User.fromSnapshot(snapshot);
  }

  User get currentUser => Modular.get<AppStore>().currentUser;

  @computed
  bool get isFollowing => currentUser.following.contains(otherUserId);

  @action
  Future<void> followUser(userId) async {
    if (isFollowing) {
      // currentUser.following.toList().remove(userId);
      // otherUser.followers.toList().remove(currentUser.id);

      await store.userCollection.document(currentUser.id).updateData({
        "following": FieldValue.arrayRemove([userId])
      });

      await store.userCollection.document(userId).updateData({
        "followers": FieldValue.arrayRemove([currentUser.id])
      });
    } else {
      // currentUser.following.toList().add(userId);
      // otherUser.followers.toList().add(currentUser.id);

      await store.userCollection.document(currentUser.id).updateData({
        "following": FieldValue.arrayUnion([userId])
      });

      await store.userCollection.document(userId).updateData({
        "followers": FieldValue.arrayUnion([currentUser.id])
      });
    }
  }
}
