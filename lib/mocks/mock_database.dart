import 'package:built_collection/built_collection.dart';
import 'package:highvibe/models/models.dart';

final mockUser = User((b) => b
  ..id = "default"
  ..name = "Default User"
  ..chatId = "default");

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
        "users": { "${mockUser.id}": ${mockUser.toJson()} },
        "channels": {"${mockUser.id}": ${mockChannel.toJson()} },
        "messages": {"${mockMessages[0].id}": ${mockMessages[0].toJson()}, "${mockMessages[1].id}": ${mockMessages[1].toJson()}},
      }
    """;
