import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_store.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  final String id, email, address, account;
  final String chatId, videoId;

  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final DateTime lastTimeSeen;

  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final DateTime accountCreationTime;

  User({
    this.id,
    this.email,
    this.lastTimeSeen,
    this.accountCreationTime,
    this.chatId,
    this.videoId,
    this.address,
    this.account,
    String name,
    String status,
    String photoUrl,
    String info,
    String playlist,
    int karmaPoints,
    int experiencePoints,
    List<String> followers,
    List<String> following,
    List<String> uploads,
    List<String> featured,
    List<String> badges,
    List<String> scheduled,
    bool isLive,
    bool isOnline,
  }) : super(
          name: name,
          status: status,
          photoUrl: photoUrl,
          info: info,
          karmaPoints: karmaPoints,
          experiencePoints: experiencePoints,
          followers: ObservableList<String>.of(followers ?? []),
          following: ObservableList<String>.of(following ?? []),
          uploads: ObservableList<String>.of(uploads ?? []),
          featured: ObservableList<String>.of(featured ?? []),
          badges: ObservableList<String>.of(badges ?? []),
          scheduled: ObservableList<String>.of(scheduled ?? []),
          isLive: isLive,
          isOnline: isOnline,
          playlist: playlist,
        );

  factory User.createNew(
      {String uid, String email, String name, String photoUrl}) {
    return User(
      id: uid,
      name: name ?? 'Anonymous',
      email: email,
      photoUrl: photoUrl,
      info: '',
      playlist: '',
      isOnline: true,
      isLive: false,
      lastTimeSeen: DateTime.now().toUtc(),
      accountCreationTime: DateTime.now().toUtc(),
      karmaPoints: 0,
      experiencePoints: 0,
      chatId: uid,
      videoId: uid,
      address: uid,
      account: uid,
      followers: List<String>(),
      following: List<String>(),
      uploads: List<String>(),
      featured: List<String>(),
      badges: List<String>(),
      scheduled: List<String>(),
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static DateTime _timeFromJson(ts) =>
      ts is DateTime ? ts : (ts as Timestamp)?.toDate();
  static DateTime _timeToJson(DateTime time) => time;
}

abstract class _User with Store {
  @observable
  int value = 0;

  @observable
  bool isLive;

  @observable
  bool isOnline;

  @observable
  String name;

  @observable
  String status;

  @observable
  String info;

  @observable
  String playlist;

  @observable
  String photoUrl;

  @observable
  ObservableList<String> following;

  @observable
  ObservableList<String> followers;

  @observable
  ObservableList<String> badges;

  @observable
  ObservableList<String> uploads;

  @observable
  ObservableList<String> featured;

  @observable
  ObservableList<String> scheduled;

  @observable
  int karmaPoints;

  @observable
  int experiencePoints;

  _User({
    this.name,
    this.status,
    this.photoUrl,
    this.info,
    this.following,
    this.followers,
    this.badges,
    this.uploads,
    this.featured,
    this.karmaPoints,
    this.experiencePoints,
    this.isLive,
    this.isOnline,
    this.scheduled,
    this.playlist,
  });
}
