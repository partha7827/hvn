library video;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hvn/models/models.dart';
import 'package:hvn/models/serializer/serializer.dart';
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

  static Video fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(Video.serializer, snapshot.data);
  }

  static BuiltList<Video> parseListOfVideos(QuerySnapshot snapshot) {
    return deserializeListOf<Video>(snapshot.documents.map((s) => s.data));
  }

  static void _initializeBuilder(VideoBuilder b) => b
    ..id = Uuid().v4()
    ..fileDetails = FileDetails().toBuilder()
    ..snippet = Snippet().toBuilder();
}
