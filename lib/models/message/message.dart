import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:uuid/uuid.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  static Serializer<Message> get serializer => _$messageSerializer;
  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  Message._();

  String get id;
  String get chatId;
  String get authorId;
  String get authorName;
  String get authorPhotoUrl;
  String get content;
  DateTime get createdAt;

  String toJson() {
    return json.encode(serializers.serializeWith(Message.serializer, this));
  }

  static Message fromJson(String jsonString) {
    return serializers.deserializeWith(
        Message.serializer, json.decode(jsonString));
  }

  static Message fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(Message.serializer, snapshot.data);
  }

  static BuiltList<Message> parseListOfMessages(QuerySnapshot snapshot) {
    return deserializeListOf<Message>(snapshot.documents.map((s) => s.data));
  }

  static void _initializeBuilder(MessageBuilder b) => b
    ..id = Uuid().v4()
    ..chatId = ''
    ..authorId = ''
    ..authorName = ''
    ..authorPhotoUrl = ''
    ..content = ''
    ..createdAt = DateTime.now().toUtc();
}
