import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/services/user_queries.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';

abstract class IFirestoreService {
  CollectionReference userCollection;
  CollectionReference messageCollection;
  CollectionReference channelCollection;
  CollectionReference tagCollection;
  CollectionReference videoCollection;
  CollectionReference audioCollection;
}

class FirestoreService extends IFirestoreService with UserQueries {
  FirestoreService(firestore) {
    userCollection = firestore.collection("users");
    messageCollection = firestore.collection("messages");
    channelCollection = firestore.collection("channels");
    tagCollection = firestore.collection("tags");
    videoCollection = firestore.collection("video");
    audioCollection = firestore.collection("audio");
  }

  factory FirestoreService.withFirebase() => FirestoreService(Firestore.instance);
  CollectionReference _messageCollection;

  factory FirestoreService.withMock() =>
      FirestoreService(MockCloudFirestore(mockDatabase));
  CollectionReference get messageCollection => _messageCollection;

  void dispose() {}
}
