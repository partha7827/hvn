library snippet;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'snippet.g.dart';

abstract class Snippet implements Built<Snippet, SnippetBuilder> {
  static Serializer<Snippet> get serializer => _$snippetSerializer;
  factory Snippet([void Function(SnippetBuilder) updates]) = _$Snippet;
  Snippet._();

  String get title;
  String get description;
  DateTime get publishedAt;
  BuiltList<String> get tags;
  Thumbnail get videoThumbnail;

  String toJson() {
    return json.encode(serializers.serializeWith(Snippet.serializer, this));
  }

  static Snippet fromJson(String jsonString) {
    return serializers.deserializeWith(
        Snippet.serializer, json.decode(jsonString));
  }

  static void _initializeBuilder(SnippetBuilder b) => b
    ..title = 'No Title'
    ..description = 'No Description'
    ..publishedAt = DateTime.now().toUtc()
    ..tags = BuiltList<String>([]).toBuilder()
    ..videoThumbnail = Thumbnail().toBuilder();
}
