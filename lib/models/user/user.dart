library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  factory User([void Function(UserBuilder) updates]) = _$User;

  User._();

  String get account;

  DateTime get accountCreationTime;

  String get address;

  BuiltList<String> get badges;

  String get chatId;

  String get email;

  int get experiencePoints;

  BuiltList<String> get featured;

  BuiltList<String> get followers;

  BuiltList<String> get following;

  String get id;

  String get info;

  bool get isLive;

  bool get isOnline;

  int get karmaPoints;

  String get name;

  String get photoUrl;

  @nullable
  String get playlist;

  BuiltList<String> get scheduled;

  String get status;

  BuiltList<String> get uploads;

  String get videoId;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  static User fromSnapshot(DocumentSnapshot snapshot) {
    return serializers.deserializeWith(User.serializer, snapshot.data);
  }

  static void _initializeBuilder(UserBuilder b) => b
    ..accountCreationTime = DateTime.now().toUtc()
    ..address = ''
    ..experiencePoints = 0
    ..info = ''
    ..isLive = false
    ..isOnline = true
    ..karmaPoints = 0
    ..photoUrl = ''
    ..status = ''
    ..videoId = ''
    ..chatId = ''
    ..name = ''
    ..account = ''
    ..email = ''
    ..name = ''
    ;
}
