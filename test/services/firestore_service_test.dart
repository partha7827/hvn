import 'package:highvibe/services/firestore_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/mocks/mock_video_files.dart';
import 'package:highvibe/models/models.dart';

void main() async {
  final firestore = FirestoreService.withMock();

  test('initialize store service', () async {
    expect(firestore.userCollection, isInstanceOf<CollectionReference>());
  });

  test('get user document', () async {
    final document = await firestore.userCollection.document('default').get();

    expect(document.data['name'], equals('Default User'));
  });

  test('get video document', () async {
    final document = await firestore.videoCollection.document('1').get();

    final video = Video.fromSnapshot(document);

    expect(video.snippet.videoThumbnail.height, equals(1080));
  });

  test('parse list of users', () async {
    final snapshot = await firestore.userCollection.getDocuments();

    final users = User.parseListOfUsers(snapshot).toList();

    expect(users[0], equals(mockUser));
  });

  test('parse list of videos', () async {
    final snapshot = await firestore.videoCollection.getDocuments();

    final videos = Video.parseListOfVideos(snapshot).toList();

    expect(videos[0], equals(mockVideo));
  });

  test('get channel document', () async {
    final document =
        await firestore.channelCollection.document('default').get();

    expect(document.data['id'], equals('default'));
  });
}
