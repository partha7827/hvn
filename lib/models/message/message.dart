import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  String get id;
  
  String get channelId;
  
  String get senderId;
  
  @nullable
  String get senderName;
  
  @nullable
  String get senderPhotoUrl;
  
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

  static Message fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(Message.serializer, snapshot);
  }

  static Serializer<Message> get serializer => _$messageSerializer;

  static void _initializeBuilder(MessageBuilder b) => b..content = "" ..createdAt = DateTime.now().toUtc();
}