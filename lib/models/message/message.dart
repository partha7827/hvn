import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  String get id;
  
  String get channelId;
  
  String get authorId;
  
  @nullable
  String get authorName;
  
  @nullable
  String get authorPhotoUrl;
  
  String get content;
  
  DateTime get createdAt;

  Message._();
  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  String toJson() {
    return json.encode(serializers.serializeWith(Message.serializer, this));
  }

  static Message fromJson(String jsonString) {
    return serializers.deserializeWith(Message.serializer, json.decode(jsonString));
  }

  static Serializer<Message> get serializer => _$messageSerializer;

  static void _initializeBuilder(MessageBuilder b) => b..content = "" ..createdAt = DateTime.now().toUtc();
}