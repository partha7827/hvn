library audio_file;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'audio_file.g.dart';

abstract class AudioFile implements Built<AudioFile, AudioFileBuilder> {
  static Serializer<AudioFile> get serializer => _$audioFileSerializer;

  factory AudioFile([void Function(AudioFileBuilder) updates]) = _$AudioFile;

  AudioFile._();
  
  String get id;

  String get author;
  
  @nullable
  String get artworkUrlPath;
  
  String get audioFileUrlPath;

  @nullable
  int get duration;
  
  @nullable
  String get title;
  
  
  String get subTitle;
  
  
  BuiltList<String> get tagIds;

  String toJson() {
    return json.encode(serializers.serializeWith(AudioFile.serializer, this));
  }

  static AudioFile fromJson(String jsonString) {
    return serializers.deserializeWith(
        AudioFile.serializer, json.decode(jsonString));
  }

  static String listOfAudioFilesToJson(List<AudioFile> audioFiles) {
    final data = <String>[];
    audioFiles.forEach((item) => data.add(item.toJson()));
    return '$data';
  }

  static BuiltList<AudioFile> parseListOfAudioFiles(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return deserializeListOf<AudioFile>(parsed);
  }
}
