import 'package:highvibe/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'dart:convert';

main() async {
  final userInstance = User((b) => b
    ..id = "aabbcc"
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

  test("user model", () async {
    final serialized = serializers.serializeWith(User.serializer, userInstance);

    final deserialized =
        serializers.deserializeWith(User.serializer, serialized);

    expect(deserialized, userInstance);
  });
}
