library playlist;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/models.dart' show Audio, Privacy;
import 'package:highvibe/models/serializer/serializer.dart';

part 'playlist.g.dart';

final Set<PlayList> tempInMemoryPlaylistCollection = {};

abstract class PlayList implements Built<PlayList, PlayListBuilder> {
  static Serializer<PlayList> get serializer => _$playListSerializer;

  factory PlayList([void Function(PlayListBuilder) updates]) = _$PlayList;

  PlayList._();

  String get id;
  BuiltList<Audio> get audioFiles;
  String get coverUrlPath;
  @nullable
  String get description;
  @nullable
  String get title;
  Privacy get privacy;

  String toJson() {
    return json.encode(serializers.serializeWith(PlayList.serializer, this));
  }

  static PlayList fromJson(String jsonString) {
    return serializers.deserializeWith(
        PlayList.serializer, json.decode(jsonString));
  }
}
