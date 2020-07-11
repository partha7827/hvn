library audio_file;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/assets.dart';
import 'package:uuid/uuid.dart';

part 'audio.g.dart';

abstract class Audio implements Built<Audio, AudioBuilder> {
  static Serializer<Audio> get serializer => _$audioSerializer;
  factory Audio([void Function(AudioBuilder) updates]) = _$Audio;

  Audio._();

  String get id;
  String get userId;
  String get userName;
  String get userAvatar;
  String get title;
  String get subTitle;
  String get author;
  String get artworkUrlPath;
  String get audioUrlPath;
  bool get isRecommended;
  int get duration;
  BuiltList<String> get tags;

  String toJson() {
    return json.encode(serializers.serializeWith(Audio.serializer, this));
  }

  static Audio fromJson(String jsonString) {
    return serializers.deserializeWith(
        Audio.serializer, json.decode(jsonString));
  }

  static String listOfAudiosToJson(List<Audio> audios) {
    final data = <String>[];
    audios.forEach((item) => data.add(item.toJson()));
    return '$data';
  }

  static Audio fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(Audio.serializer, snapshot.data);
  }

  static BuiltList<Audio> parseListOfAudios(QuerySnapshot snapshot) {
    return deserializeListOf<Audio>(snapshot.documents.map((s) => s.data));
  }

  static void _initializeBuilder(AudioBuilder b) => b
    ..id = Uuid().v4()
    ..userId = Uuid().v4()
    ..userName = ''
    ..userAvatar = ''
    ..title = Strings.audioTitlePlaceholder
    ..subTitle = ''
    ..author = ''
    ..artworkUrlPath = Assets.audioArtworkPlaceholder
    ..audioUrlPath = ''
    ..duration = 0
    ..isRecommended = false
    ..tags = BuiltList<String>([]).toBuilder();
}
