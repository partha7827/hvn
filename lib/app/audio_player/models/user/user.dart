library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:highvibe/app/audio_player/models/serializer/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String get id;
  String get email;
  String get address;
  String get account;
  String get chatId;
  String get videoId;
  DateTime get lastTimeSeen;
  DateTime get accountCreationTime;

  @nullable
  String get name;

  @nullable
  String get status;

  @nullable
  String get photoUrl;

  @nullable
  String get info;

  @nullable
  String get playlist;

  @nullable
  int get karmaPoints;

  @nullable
  int get experiencePoints;

  BuiltList<String> get followers;

  BuiltList<String> get following;

  BuiltList<String> get uploads;

  BuiltList<String> get featured;

  BuiltList<String> get badges;

  BuiltList<String> get scheduled;

  bool get isLive;

  bool get isOnline;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  static Serializer<User> get serializer => _$userSerializer;
}
