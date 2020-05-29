library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';
import 'package:highvibe/values/assets.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;
  factory User([void Function(UserBuilder) updates]) = _$User;

  User._();

  String get id;
  String get account;
  String get address;
  String get chatId;
  String get liveId;
  String get status;
  String get email;
  String get name;
  String get photoUrl;
  String get bio;
  int get experiencePoints;
  int get karmaPoints;
  bool get isLive;
  bool get isOnline;
  bool get isRecommended;
  bool get isAuthor;
  DateTime get accountCreationTime;
  BuiltList<String> get badges;
  BuiltList<String> get featured;
  BuiltList<String> get followers;
  BuiltList<String> get following;
  BuiltList<String> get scheduled;
  BuiltList<String> get videos;
  BuiltList<String> get audios;
  BuiltList<String> get tags;

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

  static BuiltList<User> parseListOfUsers(QuerySnapshot snapshot) {
    return deserializeListOf<User>(snapshot.documents.map((s) => s.data));
  }

  static void _initializeBuilder(UserBuilder b) => b
    ..id = Uuid().v4()
    ..account = b.id
    ..address = b.id
    ..chatId = b.id
    ..liveId = b.id
    ..status = "Author"
    ..email = ""
    ..name = ""
    ..photoUrl = Assets.dummyAvatarUrl
    ..bio = ""
    ..experiencePoints = 0
    ..karmaPoints = 0
    ..isLive = false
    ..isOnline = false
    ..isRecommended = false
    ..isAuthor = false
    ..accountCreationTime = DateTime.now().toUtc()
    ..badges = BuiltList<String>([]).toBuilder()
    ..featured = BuiltList<String>([]).toBuilder()
    ..followers = BuiltList<String>([]).toBuilder()
    ..following = BuiltList<String>([]).toBuilder()
    ..scheduled = BuiltList<String>([]).toBuilder()
    ..videos = BuiltList<String>([]).toBuilder()
    ..audios = BuiltList<String>([]).toBuilder();
}
