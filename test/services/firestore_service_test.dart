import 'package:highvibe/services/firestore_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/mocks/mock_video_files.dart';
import 'package:highvibe/models/models.dart';

main() async {
  final firestore = FirestoreService.withMock();

  test("initialize store service", () async {
    expect(firestore.userCollection, isInstanceOf<CollectionReference>());
  });

  test("get user document", () async {
    var document = await firestore.userCollection.document("default").get();

    expect(document.data["name"], equals('Default User'));
  });

  test("get video document", () async {
    var document = await firestore.videoCollection.document("1").get();

    var video = Video.fromSnapshot(document);

    expect(video.snippet.videoThumbnail.height, equals(1080));
  });

  test("parse list of users", () async {
    var snapshot = await firestore.userCollection.getDocuments();

    var users = User.parseListOfUsers(snapshot).toList();

    expect(users[0], equals(mockUser));
  });

  test("parse list of videos", () async {
    var snapshot = await firestore.videoCollection.getDocuments();

    var videos = Video.parseListOfVideos(snapshot).toList();

    expect(videos[0], equals(mockVideo));
  });

  test("get channel document", () async {
    var document = await firestore.channelCollection.document("default").get();

    expect(document.data["id"], equals("default"));
  });
}
