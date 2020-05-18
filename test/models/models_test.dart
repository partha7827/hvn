import 'package:highvibe/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';

main() async {
  final userInstance = User((b) => b
    ..id = "default"
    ..accountCreationTime = DateTime.now().toUtc()
    ..address = ''
    ..experiencePoints = 0
    ..info = ''
    ..isLive = false
    ..isOnline = true
    ..karmaPoints = 0
    ..photoUrl = ''
    ..status = ''
    ..videoId = ''
    ..chatId = ''
    ..name = ''
    ..account = ''
    ..email = ''
    ..name = '');

  final audioFileInstance = AudioFile((b) => b
    ..id = "1"
    ..author = userInstance.id
    ..audioFileUrlPath = "empty"
    );

  final messageInstance = Message((b) => b
    ..id = "1"
    ..senderId = userInstance.id
    ..senderName = userInstance.name
    ..senderPhotoUrl = userInstance.photoUrl
    ..channelId = "1"
    ..content = "message");

  final tagInstance = Tag((b) => b
    ..id = "1"
    ..name = "meditation"
    ..createdAt = DateTime.now().toUtc()
    ..isRecommended = true
    ..isVisible = true
  );

  final channelInstance = Channel((b) => b..id = "1" ..messages = ListBuilder([messageInstance]));

  test("user model", () async {
    final serialized = serializers.serializeWith(User.serializer, userInstance);

    final deserialized =
        serializers.deserializeWith(User.serializer, serialized);

    expect(deserialized, userInstance);
  });

  test("audio file model", () async {
    final serialized =
        serializers.serializeWith(AudioFile.serializer, audioFileInstance);

    final deserialized =
        serializers.deserializeWith(AudioFile.serializer, serialized);

    expect(deserialized, audioFileInstance);
  });

  test("message model", () async {
    final serialized =
        serializers.serializeWith(Message.serializer, messageInstance);

    final deserialized =
        serializers.deserializeWith(Message.serializer, serialized);

    expect(deserialized, messageInstance);
  });

  test("tag model", () async {
    final serialized = serializers.serializeWith(Tag.serializer, tagInstance);

    final deserialized =
        serializers.deserializeWith(Tag.serializer, serialized);

    expect(deserialized, tagInstance);
  });

  test("channel model", () async {
    final serialized = serializers.serializeWith(Channel.serializer, channelInstance);

    final deserialized = serializers.deserializeWith(Channel.serializer, serialized);

    expect(deserialized, channelInstance);
  });
}
