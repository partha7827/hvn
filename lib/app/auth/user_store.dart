import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_store.g.dart';

@JsonSerializable()
class User extends _UserStoreBase with _$User {
  final String id, email;
  final bool isOnline;

  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final DateTime lastTimeSeen;

  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  final DateTime accountCreationTime;

  User({
    this.id,
    this.email,
    this.isOnline,
    this.lastTimeSeen,
    this.accountCreationTime,
    String name,
    String status,
    String photoUrl,
    List<String> following,
    List<String> tribes,
    List<String> meditations,
  }) : super(
    name: name,
    status: status,
    photoUrl: photoUrl,
    following: ObservableList<String>.of(following ?? []),
    tribes: ObservableList<String>.of(tribes ?? []),
    meditations: ObservableList<String>.of(meditations ?? []),
  );

  factory User.createNew({
    String uid,
    String email,
    String name,
    String photoUrl
  }) {
    return User(
      id: uid,
      name: name ?? 'Anonymous',
      email: email,
      photoUrl: photoUrl,
      isOnline: true,
      lastTimeSeen: DateTime.now().toUtc(),
      accountCreationTime: DateTime.now().toUtc(),
      following: List<String>(),
      tribes: List<String>(),
      meditations: List<String>(),
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static DateTime _timeFromJson(ts) =>
      ts is DateTime ? ts : (ts as Timestamp)?.toDate();
  static DateTime _timeToJson(DateTime time) => time;
}

abstract class _UserStoreBase with Store {
  @observable
  int value = 0;

  @observable
  String name;

  @observable
  String status;

  @observable
  String photoUrl;

  @observable
  ObservableList<String> following;

  @observable
  ObservableList<String> tribes;

  @observable
  ObservableList<String> meditations;

  @observable
  int karmaPoints;

  @observable
  int experiencePoints;

  _UserStoreBase({
    this.name,
    this.status,
    this.photoUrl,
    this.following,
    this.tribes,
    this.meditations,
    this.karmaPoints,
    this.experiencePoints
  });
}
