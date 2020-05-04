// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    email: json['email'] as String,
    lastTimeSeen: User._timeFromJson(json['lastTimeSeen']),
    accountCreationTime: User._timeFromJson(json['accountCreationTime']),
    chatId: json['chatId'] as String,
    videoId: json['videoId'] as String,
    address: json['address'] as String,
    account: json['account'] as String,
    name: json['name'] as String,
    status: json['status'] as String,
    photoUrl: json['photoUrl'] as String,
    info: json['info'] as String,
    playlist: json['playlist'] as String,
    karmaPoints: json['karmaPoints'] as int,
    experiencePoints: json['experiencePoints'] as int,
    followers: (json['followers'] as List)?.map((e) => e as String)?.toList(),
    following: (json['following'] as List)?.map((e) => e as String)?.toList(),
    uploads: (json['uploads'] as List)?.map((e) => e as String)?.toList(),
    featured: (json['featured'] as List)?.map((e) => e as String)?.toList(),
    badges: (json['badges'] as List)?.map((e) => e as String)?.toList(),
    scheduled: (json['scheduled'] as List)?.map((e) => e as String)?.toList(),
    isLive: json['isLive'] as bool,
    isOnline: json['isOnline'] as bool,
  )..value = json['value'] as int;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'value': instance.value,
      'isLive': instance.isLive,
      'isOnline': instance.isOnline,
      'name': instance.name,
      'status': instance.status,
      'info': instance.info,
      'playlist': instance.playlist,
      'photoUrl': instance.photoUrl,
      'following': instance.following,
      'followers': instance.followers,
      'badges': instance.badges,
      'uploads': instance.uploads,
      'featured': instance.featured,
      'scheduled': instance.scheduled,
      'karmaPoints': instance.karmaPoints,
      'experiencePoints': instance.experiencePoints,
      'id': instance.id,
      'email': instance.email,
      'address': instance.address,
      'account': instance.account,
      'chatId': instance.chatId,
      'videoId': instance.videoId,
      'lastTimeSeen': User._timeToJson(instance.lastTimeSeen),
      'accountCreationTime': User._timeToJson(instance.accountCreationTime),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _User, Store {
  final _$valueAtom = Atom(name: '_User.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$isLiveAtom = Atom(name: '_User.isLive');

  @override
  bool get isLive {
    _$isLiveAtom.context.enforceReadPolicy(_$isLiveAtom);
    _$isLiveAtom.reportObserved();
    return super.isLive;
  }

  @override
  set isLive(bool value) {
    _$isLiveAtom.context.conditionallyRunInAction(() {
      super.isLive = value;
      _$isLiveAtom.reportChanged();
    }, _$isLiveAtom, name: '${_$isLiveAtom.name}_set');
  }

  final _$isOnlineAtom = Atom(name: '_User.isOnline');

  @override
  bool get isOnline {
    _$isOnlineAtom.context.enforceReadPolicy(_$isOnlineAtom);
    _$isOnlineAtom.reportObserved();
    return super.isOnline;
  }

  @override
  set isOnline(bool value) {
    _$isOnlineAtom.context.conditionallyRunInAction(() {
      super.isOnline = value;
      _$isOnlineAtom.reportChanged();
    }, _$isOnlineAtom, name: '${_$isOnlineAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_User.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$statusAtom = Atom(name: '_User.status');

  @override
  String get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$infoAtom = Atom(name: '_User.info');

  @override
  String get info {
    _$infoAtom.context.enforceReadPolicy(_$infoAtom);
    _$infoAtom.reportObserved();
    return super.info;
  }

  @override
  set info(String value) {
    _$infoAtom.context.conditionallyRunInAction(() {
      super.info = value;
      _$infoAtom.reportChanged();
    }, _$infoAtom, name: '${_$infoAtom.name}_set');
  }

  final _$playlistAtom = Atom(name: '_User.playlist');

  @override
  String get playlist {
    _$playlistAtom.context.enforceReadPolicy(_$playlistAtom);
    _$playlistAtom.reportObserved();
    return super.playlist;
  }

  @override
  set playlist(String value) {
    _$playlistAtom.context.conditionallyRunInAction(() {
      super.playlist = value;
      _$playlistAtom.reportChanged();
    }, _$playlistAtom, name: '${_$playlistAtom.name}_set');
  }

  final _$photoUrlAtom = Atom(name: '_User.photoUrl');

  @override
  String get photoUrl {
    _$photoUrlAtom.context.enforceReadPolicy(_$photoUrlAtom);
    _$photoUrlAtom.reportObserved();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.context.conditionallyRunInAction(() {
      super.photoUrl = value;
      _$photoUrlAtom.reportChanged();
    }, _$photoUrlAtom, name: '${_$photoUrlAtom.name}_set');
  }

  final _$followingAtom = Atom(name: '_User.following');

  @override
  ObservableList<String> get following {
    _$followingAtom.context.enforceReadPolicy(_$followingAtom);
    _$followingAtom.reportObserved();
    return super.following;
  }

  @override
  set following(ObservableList<String> value) {
    _$followingAtom.context.conditionallyRunInAction(() {
      super.following = value;
      _$followingAtom.reportChanged();
    }, _$followingAtom, name: '${_$followingAtom.name}_set');
  }

  final _$followersAtom = Atom(name: '_User.followers');

  @override
  ObservableList<String> get followers {
    _$followersAtom.context.enforceReadPolicy(_$followersAtom);
    _$followersAtom.reportObserved();
    return super.followers;
  }

  @override
  set followers(ObservableList<String> value) {
    _$followersAtom.context.conditionallyRunInAction(() {
      super.followers = value;
      _$followersAtom.reportChanged();
    }, _$followersAtom, name: '${_$followersAtom.name}_set');
  }

  final _$badgesAtom = Atom(name: '_User.badges');

  @override
  ObservableList<String> get badges {
    _$badgesAtom.context.enforceReadPolicy(_$badgesAtom);
    _$badgesAtom.reportObserved();
    return super.badges;
  }

  @override
  set badges(ObservableList<String> value) {
    _$badgesAtom.context.conditionallyRunInAction(() {
      super.badges = value;
      _$badgesAtom.reportChanged();
    }, _$badgesAtom, name: '${_$badgesAtom.name}_set');
  }

  final _$uploadsAtom = Atom(name: '_User.uploads');

  @override
  ObservableList<String> get uploads {
    _$uploadsAtom.context.enforceReadPolicy(_$uploadsAtom);
    _$uploadsAtom.reportObserved();
    return super.uploads;
  }

  @override
  set uploads(ObservableList<String> value) {
    _$uploadsAtom.context.conditionallyRunInAction(() {
      super.uploads = value;
      _$uploadsAtom.reportChanged();
    }, _$uploadsAtom, name: '${_$uploadsAtom.name}_set');
  }

  final _$featuredAtom = Atom(name: '_User.featured');

  @override
  ObservableList<String> get featured {
    _$featuredAtom.context.enforceReadPolicy(_$featuredAtom);
    _$featuredAtom.reportObserved();
    return super.featured;
  }

  @override
  set featured(ObservableList<String> value) {
    _$featuredAtom.context.conditionallyRunInAction(() {
      super.featured = value;
      _$featuredAtom.reportChanged();
    }, _$featuredAtom, name: '${_$featuredAtom.name}_set');
  }

  final _$scheduledAtom = Atom(name: '_User.scheduled');

  @override
  ObservableList<String> get scheduled {
    _$scheduledAtom.context.enforceReadPolicy(_$scheduledAtom);
    _$scheduledAtom.reportObserved();
    return super.scheduled;
  }

  @override
  set scheduled(ObservableList<String> value) {
    _$scheduledAtom.context.conditionallyRunInAction(() {
      super.scheduled = value;
      _$scheduledAtom.reportChanged();
    }, _$scheduledAtom, name: '${_$scheduledAtom.name}_set');
  }

  final _$karmaPointsAtom = Atom(name: '_User.karmaPoints');

  @override
  int get karmaPoints {
    _$karmaPointsAtom.context.enforceReadPolicy(_$karmaPointsAtom);
    _$karmaPointsAtom.reportObserved();
    return super.karmaPoints;
  }

  @override
  set karmaPoints(int value) {
    _$karmaPointsAtom.context.conditionallyRunInAction(() {
      super.karmaPoints = value;
      _$karmaPointsAtom.reportChanged();
    }, _$karmaPointsAtom, name: '${_$karmaPointsAtom.name}_set');
  }

  final _$experiencePointsAtom = Atom(name: '_User.experiencePoints');

  @override
  int get experiencePoints {
    _$experiencePointsAtom.context.enforceReadPolicy(_$experiencePointsAtom);
    _$experiencePointsAtom.reportObserved();
    return super.experiencePoints;
  }

  @override
  set experiencePoints(int value) {
    _$experiencePointsAtom.context.conditionallyRunInAction(() {
      super.experiencePoints = value;
      _$experiencePointsAtom.reportChanged();
    }, _$experiencePointsAtom, name: '${_$experiencePointsAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},isLive: ${isLive.toString()},isOnline: ${isOnline.toString()},name: ${name.toString()},status: ${status.toString()},info: ${info.toString()},playlist: ${playlist.toString()},photoUrl: ${photoUrl.toString()},following: ${following.toString()},followers: ${followers.toString()},badges: ${badges.toString()},uploads: ${uploads.toString()},featured: ${featured.toString()},scheduled: ${scheduled.toString()},karmaPoints: ${karmaPoints.toString()},experiencePoints: ${experiencePoints.toString()}';
    return '{$string}';
  }
}
