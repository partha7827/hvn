library file_details;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'file_details.g.dart';

abstract class FileDetails implements Built<FileDetails, FileDetailsBuilder> {
  static Serializer<FileDetails> get serializer => _$fileDetailsSerializer;
  factory FileDetails([void Function(FileDetailsBuilder) updates]) = _$FileDetails;
  FileDetails._();

  String get url;
  String get fileName;
  int get bitrateBps;
  int get durationMs;
  int get fileSize;
  DateTime get creationTime;

  String toJson() {
    return json.encode(serializers.serializeWith(FileDetails.serializer, this));
  }

  static FileDetails fromJson(String jsonString) {
    return serializers.deserializeWith(
        FileDetails.serializer, json.decode(jsonString));
  }

  static void _initializeBuilder(FileDetailsBuilder b) => b
    ..url = ""
    ..fileName = ""
    ..bitrateBps = 0
    ..durationMs = 0
    ..fileSize = 0
    ..creationTime = DateTime.now().toUtc();
}
