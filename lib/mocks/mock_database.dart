import 'package:built_collection/built_collection.dart';
import 'package:highvibe/models/models.dart';

final _mockFileDetails = FileDetails(
  (b) => b
    ..bitrateBps = 24
    ..creationTime = DateTime.now().toUtc()
    ..durationMs = 62000
    ..fileName = 'natural_beauty_never_ends'
    ..fileSize = 17601719
    ..url =
        'https://firebasestorage.googleapis.com/v0/b/highvibe-8601d.appspot.com/o/videos%2Fnatural_beauty_never_ends.mp4?alt=media&token=378c2e3e-47e9-4865-8e23-16c2e939bd7a',
);

final _mockSnippet = Snippet(
  (b) => b
    ..tags.replace(
      BuiltList<String>(
        [
          'nature',
          'hd',
          'relaxing',
        ],
      ),
    )
    ..videoThumbnail = _mockVideoThumbnail.toBuilder(),
);

final _mockVideoThumbnail = Thumbnail(
  (b) => b
    ..url =
        'https://firebasestorage.googleapis.com/v0/b/highvibe-8601d.appspot.com/o/images%2Fnatural_beauty_never_ends.png?alt=media&token=d30509b4-dc2c-4577-82c3-3106f0f75795'
    ..width = 1900
    ..height = 1080,
);

final mockVideo = Video(
  (b) => b
    ..id = "1"
    ..fileDetails = _mockFileDetails.toBuilder()
    ..snippet = _mockSnippet.toBuilder(),
);

var mockUser = User((b) => b
  ..id = "default"
  ..name = "Default User"
  ..isRecommended = true);

var mockAnotherUser = User((b) => b
  ..id = "another"
  ..name = "Another User");

final mockMessages = BuiltList.from([
  Message((b) => b
    ..id = "1"
    ..channelId = "default"
    ..senderId = "default"
    ..content = "first message"),
  Message((b) => b
    ..id = "2"
    ..channelId = "default"
    ..senderId = "default"
    ..content = "second message"),
]);

final mockChannel = Channel((b) => b
  ..id = "default"
  ..messages = mockMessages.toBuilder());

final mockDatabase = """
      {
        "users": {
          "${mockUser.id}": ${mockUser.toJson()},
          "${mockAnotherUser.id}": ${mockAnotherUser.toJson()},
          "__where__": {
            "isRecommended == true": {
              "${mockUser.id}": ${mockUser.toJson()}
            }
          }
        },
        "videos": { "${mockVideo.id}": ${mockVideo.toJson()} }
      }
        "channels": {"${mockUser.id}": ${mockChannel.toJson()} },
        "messages": {"${mockMessages[0].id}": ${mockMessages[0].toJson()}, "${mockMessages[1].id}": ${mockMessages[1].toJson()}},
    """;
