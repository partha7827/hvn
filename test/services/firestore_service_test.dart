import 'package:highvibe/services/store_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/models/models.dart';

main() async {
  final firestore = MockCloudFirestore(mockDatabase);

  final service = StoreService(firestore);

  test("initialize store service", () async {
    expect(service.userCollection, isInstanceOf<CollectionReference>());
  });

  test("get user document", () async {
    var document = await service.userCollection.document("default").get();

    expect(document.data["name"], equals('Default User'));
  });

  test("get video document", () async {
    var document = await service.videoCollection.document("1").get();

    var video = Video.fromSnapshot(document);

    expect(video.snippet.videoThumbnail.height, equals(1080));
  });

  test("parse list of users", () async {
    var snapshot = await service.userCollection.getDocuments();

    var users = User.parseListOfUsers(snapshot).toList();

    expect(users[0], equals(mockUser));
  });

  test("parse list of videos", () async {
    var snapshot = await service.videoCollection.getDocuments();

    var videos = Video.parseListOfVideos(snapshot).toList();

    expect(videos[0], equals(mockVideo));
  });

  test("get channel document", () async {
    var document = await service.channelCollection.document("default").get();

    expect(document.data["id"], equals("default"));
  });

  test("get message document", () async {
    
  });
}
