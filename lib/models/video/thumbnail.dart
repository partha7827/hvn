library thumbnail;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'thumbnail.g.dart';

abstract class Thumbnail implements Built<Thumbnail, ThumbnailBuilder> {
  static Serializer<Thumbnail> get serializer => _$thumbnailSerializer;

  factory Thumbnail([void Function(ThumbnailBuilder) updates]) = _$Thumbnail;

  Thumbnail._();

  String get url;

  @nullable
  int get width;

  @nullable
  int get height;

  String toJson() {
    return json.encode(serializers.serializeWith(Thumbnail.serializer, this));
  }

  static Thumbnail fromJson(String jsonString) {
    return serializers.deserializeWith(
        Thumbnail.serializer, json.decode(jsonString));
  }

  static void _initializeBuilder(ThumbnailBuilder b) => b..url = "" ..width = 0 ..height = 0;
}
