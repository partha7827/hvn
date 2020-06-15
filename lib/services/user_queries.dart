import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/services/firestore_service.dart';

mixin UserQueries on IFirestoreService {
  Future<void> follow(String follower, String following) {
    return Future.wait([
      userCollection.document(follower).updateData({
        'following': FieldValue.arrayUnion([following])
      }),
      userCollection.document(following).updateData({
        'followers': FieldValue.arrayUnion([follower])
      }),
    ]);
  }

  Future<void> unfollow(String follower, String following) {
    return Future.wait([
      userCollection.document(follower).updateData({
        'following': FieldValue.arrayRemove([following])
      }),
      userCollection.document(following).updateData({
        'followers': FieldValue.arrayRemove([follower])
      }),
    ]);
  }
}
