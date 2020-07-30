library audio_file;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/values/assets.dart';
import 'package:uuid/uuid.dart';

part 'audio.g.dart';

abstract class Audio implements Built<Audio, AudioBuilder> {
  static Serializer<Audio> get serializer => _$audioSerializer;
  factory Audio([void Function(AudioBuilder) updates]) = _$Audio;

  Audio._();

  String get artworkUrlPath;
  String get audioUrlPath;
  String get author;
  DateTime get createdAt;
  int get duration;
  String get id;
  bool get isBroken;
  bool get isProcessed;
  bool get isRecommended;
  int get karmaReward;
  String get subTitle;
  BuiltList<String> get tags;
  String get title;
  DateTime get updatedAt;
  String get userAvatar;
  String get userId;
  String get userName;
  String get waveformUrlPath;
  int get xpReward;

  String toJson() {
    return json.encode(serializers.serializeWith(Audio.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Audio.serializer, this);
  }

  static Audio fromJson(String jsonString) {
    return serializers.deserializeWith(
        Audio.serializer, json.decode(jsonString));
  }

  static Audio fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(Audio.serializer, snapshot.data);
  }

  static String listOfAudiosToJson(List<Audio> audios) {
    final data = <String>[];
    audios.forEach((item) => data.add(item.toJson()));
    return '$data';
  }

  static BuiltList<Audio> parseListOfAudios(QuerySnapshot snapshot) {
    return deserializeListOf<Audio>(snapshot.documents.map((s) => s.data));
  }

  static void _initializeBuilder(AudioBuilder b) => b
    ..artworkUrlPath = Assets.audioArtworkPlaceholder
    ..author = ''
    ..createdAt = DateTime.now().toUtc()
    ..duration = 0
    ..id = Uuid().v4()
    ..isBroken = false
    ..isProcessed = false
    ..isRecommended = false
    ..karmaReward = 0
    ..subTitle = ''
    ..tags = BuiltList<String>([]).toBuilder()
    ..updatedAt = DateTime.now().toUtc()
    ..userAvatar = ''
    ..userName = ''
    ..waveformUrlPath = ''
    ..xpReward = 0;
}
