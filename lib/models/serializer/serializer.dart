library serializer;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hvn/models/models.dart';
import 'package:hvn/models/tag/tag.dart';
import 'package:hvn/models/channel/channel.dart';

part 'serializer.g.dart';

@SerializersFor([
  Audio,
  FileDetails,
  Snippet,
  Tag,
  Thumbnail,
  Message,
  User,
  Video,
  Channel,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

T deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T>(serializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic items) => BuiltList.from(
    items.map((dynamic item) => deserialize<T>(item)).toList(growable: false));
