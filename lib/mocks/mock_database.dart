import 'package:built_collection/built_collection.dart';
import 'package:highvibe/models/models.dart';
import './mock_audio_files.dart';
import './mock_video_files.dart';

var mockUser = User((b) => b
  ..id = "default"
  ..name = "Default User"
  ..isRecommended = true);

var mockAnotherUser = User((b) => b
  ..id = "another"
  ..name = "Another User");

final mockMessages = BuiltList<Message>.from([
  Message((b) => b
    ..id = "1"
    ..chatId = "default"
    ..authorId = "default"
    ..content = "first message"),
  Message((b) => b
    ..id = "2"
    ..chatId = "default"
    ..authorId = "default"
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
        "audio": {
          "${mockAudioItemsList[0].id}": ${mockAudioItemsList[0].toJson()},
          "__where__": {
            "isRecommended == true": {
              "${mockAudioItemsList[0].id}": ${mockAudioItemsList[0].toJson()}
            }
          }
        },
        "video": {
          "${mockVideo.id}": ${mockVideo.toJson()},
          "__where__": {
            "isRecommended == true": {
              "${mockVideo.id}": ${mockVideo.toJson()}
            }
          }
        },
        "channels": {"${mockUser.id}": ${mockChannel.toJson()} },
        "messages": {
          "${mockMessages[0].id}": ${mockMessages[0].toJson()}, "${mockMessages[1].id}": ${mockMessages[1].toJson()},
          "__where__": {
            "isRecommended == true": {
              "${mockMessages[0].id}": ${mockMessages[0].toJson()}
            }
          }
        }
      }
    """;
