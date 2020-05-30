import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/services/user_queries.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';

class FirestoreService extends IFirestoreService with UserQueries {
  CollectionReference _messageCollection;

  // FIXME: Fix this warning
  FirestoreService(firestore) {
    userCollection = firestore.collection('users');
    messageCollection = firestore.collection('messages');
    channelCollection = firestore.collection('channels');
    tagCollection = firestore.collection('tags');
    videoCollection = firestore.collection('video');
    audioCollection = firestore.collection('audio');
  }

  factory FirestoreService.withFirebase() {
    return FirestoreService(Firestore.instance);
  }

  factory FirestoreService.withMock() {
    return FirestoreService(MockCloudFirestore(mockDatabase));
  }

  @override
  CollectionReference get messageCollection => _messageCollection;

  void dispose() {}
}

abstract class IFirestoreService {
  CollectionReference userCollection;
  CollectionReference messageCollection;
  CollectionReference channelCollection;
  CollectionReference tagCollection;
  CollectionReference videoCollection;
  CollectionReference audioCollection;
}
