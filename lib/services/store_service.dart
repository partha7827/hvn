import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';

class StoreService extends Disposable {
  StoreService(firestore) {
    _userCollection = firestore.collection("users");
    _messageCollection = firestore.collection("messages");
    _tagCollection = firestore.collection("tags");
    _videoCollection = firestore.collection("videos");
  }

  factory StoreService.withFirebase() => StoreService(Firestore.instance);

  factory StoreService.withMock() => StoreService(MockCloudFirestore(mockDatabase));

  CollectionReference _userCollection;
  CollectionReference _messageCollection;
  CollectionReference _tagCollection;
  CollectionReference _videoCollection;

  CollectionReference get userCollection => _userCollection;
  CollectionReference get messageCollection => _messageCollection;
  CollectionReference get tagCollection => _tagCollection;
  CollectionReference get videoCollection => _videoCollection;

  //dispose will be called automatically
  @override
  void dispose() {}
}
