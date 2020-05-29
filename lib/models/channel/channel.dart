import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hvn/models/message/message.dart';
import 'package:hvn/models/serializer/serializer.dart';

part 'channel.g.dart';

abstract class Channel implements Built<Channel, ChannelBuilder> {
  String get id;

  BuiltList<Message> get messages;

  Channel._();
  factory Channel([void Function(ChannelBuilder) updates]) = _$Channel;

  static Serializer<Channel> get serializer => _$channelSerializer;

  String toJson() =>
      json.encode(serializers.serializeWith(Channel.serializer, this));

  static Channel fromJson(String jsonString) =>
      serializers.deserializeWith(Channel.serializer, json.decode(jsonString));
}
