import 'package:highvibe/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/values/assets.dart';
import 'package:highvibe/values/strings.dart';

void main() async {
  test('user model', () async {
    final user = User((b) => b..id = 'default');

    expect(user.id, equals('default'));
    expect(user.chatId, equals(user.liveId));

    final serialized = serializers.serializeWith(User.serializer, user);

    final deserialized =
        serializers.deserializeWith(User.serializer, serialized);

    expect(deserialized, user);
  });

  test('audio model', () async {
    final audio = Audio();

    expect(audio.artworkUrlPath, Assets.audioArtworkPlaceholder);
    expect(audio.title, Strings.audioTitlePlaceholder);

    final serialized = serializers.serializeWith(Audio.serializer, audio);

    final deserialized =
        serializers.deserializeWith(Audio.serializer, serialized);

    expect(deserialized, audio);
  });

  test('message model', () async {
    final message = Message();

    final serialized = serializers.serializeWith(Message.serializer, message);

    final deserialized =
        serializers.deserializeWith(Message.serializer, serialized);

    expect(deserialized, message);
  });

  test('tag model', () async {
    final tag = Tag();

    final serialized = serializers.serializeWith(Tag.serializer, tag);

    final deserialized =
        serializers.deserializeWith(Tag.serializer, serialized);

    expect(deserialized, tag);
  });

  test('video model', () async {
    final video = Video();

    final serialized = serializers.serializeWith(Video.serializer, video);

    final deserialized = deserialize<Video>(serialized);

    expect(deserialized, video);
  });

  test('message model', () async {
    final messageInstance = Message((b) => b
      ..id = '1'
      ..authorId = '1'
      ..authorName = '1'
      ..authorPhotoUrl = '1'
      ..chatId = '1'
      ..content = 'message');

    final serialized =
        serializers.serializeWith(Message.serializer, messageInstance);

    final deserialized =
        serializers.deserializeWith(Message.serializer, serialized);

    expect(deserialized, messageInstance);
  });

  test('channel model', () async {
    final channelInstance = Channel((b) => b..id = 'default');

    final serialized =
        serializers.serializeWith(Channel.serializer, channelInstance);

    final deserialized =
        serializers.deserializeWith(Channel.serializer, serialized);

    expect(deserialized, channelInstance);
  });
}
