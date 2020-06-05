library playlist;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/models.dart' show Audio, Privacy;
import 'package:highvibe/models/serializer/serializer.dart';

part 'playlist.g.dart';

abstract class PlayList implements Built<PlayList, PlayListBuilder> {
  static Serializer<PlayList> get serializer => _$playListSerializer;

  factory PlayList([void Function(PlayListBuilder) updates]) = _$PlayList;

  PlayList._();

  String get coverUrlPath;
  String get desscription;
  String get title;
  Privacy get privacy;
  BuiltList<String> get audioFilesIds;

  String toJson() {
    return json.encode(serializers.serializeWith(PlayList.serializer, this));
  }

  static PlayList fromJson(String jsonString) {
    return serializers.deserializeWith(
        PlayList.serializer, json.decode(jsonString));
  }

  static BuiltList<PlayList> parseListOfPlayLists(QuerySnapshot snapshot) {
    return deserializeListOf<PlayList>(snapshot.documents.map((s) => s.data));
  }
}
