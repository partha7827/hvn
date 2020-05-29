library file_details;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hvn/models/serializer/serializer.dart';

part 'file_details.g.dart';

abstract class FileDetails implements Built<FileDetails, FileDetailsBuilder> {
  static Serializer<FileDetails> get serializer => _$fileDetailsSerializer;

  factory FileDetails([void Function(FileDetailsBuilder) updates]) =
      _$FileDetails;

  FileDetails._();

  int get bitrateBps;
  DateTime get creationTime;
  int get durationMs;
  String get fileName;
  int get fileSize;
  String get url;

  String toJson() {
    return json.encode(serializers.serializeWith(FileDetails.serializer, this));
  }

  static FileDetails fromJson(String jsonString) {
    return serializers.deserializeWith(
        FileDetails.serializer, json.decode(jsonString));
  }

  static void _initializeBuilder(FileDetailsBuilder b) => b
    ..bitrateBps = 0
    ..creationTime = DateTime.now().toUtc()
    ..durationMs = 0
    ..fileName = ''
    ..fileSize = 0
    ..url = '';
}
