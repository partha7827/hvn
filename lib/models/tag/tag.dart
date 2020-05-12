library tag;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'tag.g.dart';

abstract class Tag implements Built<Tag, TagBuilder> {
  static Serializer<Tag> get serializer => _$tagSerializer;

  factory Tag([void Function(TagBuilder) updates]) = _$Tag;

  Tag._();

  DateTime get creationAt;
  String get id;
  bool get isRecommended;
  bool get isVisible;
  String get name;

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

  static BuiltList<Tag> parseListOfTags(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return deserializeListOf<Tag>(parsed);
  }
}
