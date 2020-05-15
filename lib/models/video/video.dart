library video;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:uuid/uuid.dart';

part 'video.g.dart';

abstract class Video implements Built<Video, VideoBuilder> {
  static Serializer<Video> get serializer => _$videoSerializer;

  factory Video([void Function(VideoBuilder) updates]) = _$Video;

  Video._();

  FileDetails get fileDetails;
  String get id;
  Snippet get snippet;

  String toJson() {
    return json.encode(serializers.serializeWith(Video.serializer, this));
  }

  static Video fromJson(String jsonString) {
    return serializers.deserializeWith(
        Video.serializer, json.decode(jsonString));
  }

  static BuiltList<Video> parseListOfVideos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, Object>>();
    return deserializeListOf<Video>(parsed);
  }

  static void _initializeBuilder(VideoBuilder b) => b..id = Uuid().v4();
}
