import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/services/user_queries.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';

abstract class IStoreService {
  CollectionReference userCollection;
  CollectionReference messageCollection;
  CollectionReference tagCollection;
  CollectionReference videoCollection;
  CollectionReference audioCollection;
}

class StoreService extends IStoreService with UserQueries {
  StoreService(firestore) {
    userCollection = firestore.collection("users");
    messageCollection = firestore.collection("messages");
    tagCollection = firestore.collection("tags");
    videoCollection = firestore.collection("videos");
    audioCollection = firestore.collection("audio");
    _messageCollection = firestore.collection("messages");
  }

  factory StoreService.withFirebase() => StoreService(Firestore.instance);
  CollectionReference _messageCollection;

  factory StoreService.withMock() => StoreService(MockCloudFirestore(mockDatabase));
  CollectionReference get messageCollection => _messageCollection;

  void dispose() {}
}
