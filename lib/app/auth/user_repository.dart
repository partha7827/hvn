import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class UserRepository extends Disposable {
  final _firestore = Firestore.instance;

  CollectionReference get _userCollection => _firestore.collection("users");

  DocumentReference _userDocument(String userId) => _userCollection.document(userId);

  Future<User> fetchUserData(String userId) async {
    final doc = await _userDocument(userId).get();

    return doc.exists ? User.fromJson(doc.data) : null;
  }

  Future<void> createNewUser(User user) async {
    final userDoc = _userDocument(user.id);
    if ((await userDoc.get()).data == null) {
      await userDoc.setData(user.toJson());
    }
  }

  Stream<User> getUserStream(String userId) {
    final response = _userDocument(userId).snapshots();

    return response.map((s) => User.fromJson(s.data));
  }

  Future<void> setUserActive(String userId, bool isActive) {
    _userDocument(userId).updateData({
      "isOnline": isActive,
      "lastTimeSeen": DateTime.now().toUtc(),
    });
  }

  Future<void> updateUserInfo(User user) {
    _userDocument(user.id).updateData(user.toJson());
  }

  Future<void> followTribe(String currentUserId, String otherId) async {
    await _userDocument(currentUserId).updateData({
      "following": FieldValue.arrayUnion([otherId])
    });
    await _userDocument(otherId).updateData({
      "followers": FieldValue.arrayUnion([currentUserId])
    });
  }

  

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
