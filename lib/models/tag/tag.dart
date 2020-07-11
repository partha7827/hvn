library tag;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:uuid/uuid.dart';

part 'tag.g.dart';

abstract class Tag implements Built<Tag, TagBuilder> {
  static Serializer<Tag> get serializer => _$tagSerializer;
  factory Tag([void Function(TagBuilder) updates]) = _$Tag;

  Tag._();

  String get id;
  String get name;
  bool get isRecommended;
  bool get isVisible;
  DateTime get createdAt;

  String toJson() {
    return json.encode(serializers.serializeWith(Tag.serializer, this));
  }

  static Tag fromJson(String jsonString) {
    return serializers.deserializeWith(Tag.serializer, json.decode(jsonString));
  }

  static String listOfTagsToJson(List<Tag> tags) {
    final data = <String>[];
    tags.forEach((item) => data.add(item.toJson()));
    return '$data';
  }

  static Tag fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(Tag.serializer, snapshot.data);
  }

  static BuiltList<Tag> parseListOfTags(QuerySnapshot snapshot) {
    return deserializeListOf<Tag>(snapshot.documents.map((s) => s.data));
  }

  static void _initializeBuilder(TagBuilder b) => b
    ..id = Uuid().v4()
    ..name = ''
    ..isRecommended = false
    ..isVisible = false
    ..createdAt = DateTime.now().toUtc();
}
