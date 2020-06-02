import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/services/firestore_service.dart';

mixin UserQueries on IFirestoreService {
  void follow(String follower, String following) {
    userCollection.document(follower).updateData({
      'following': FieldValue.arrayUnion([following])
    });
    userCollection.document(following).updateData({
      'followers': FieldValue.arrayUnion([follower])
    });
  }

  void unfollow(String follower, String following) {
    userCollection.document(follower).updateData({
      'following': FieldValue.arrayRemove([following])
    });
    userCollection.document(following).updateData({
      'followers': FieldValue.arrayRemove([follower])
    });
  }
}
