library user;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  static CollectionReference _collectionRef =
      Firestore.instance.collection("users");

  String _id;
  Map<String, dynamic> _data;

  User.fromSnapshot(DocumentSnapshot snap) {
    this._id = snap.documentID;
    this._data = snap.data;
  }

  User(FirebaseUser user) {
    this._id = _collectionRef.document().documentID;
    this._data = {};
    this.account = user.uid;
    accountCreationTime = DateTime.now().toUtc();
    address = '';
    chatId = user.uid;
    email = email;
    experiencePoints = 0;
    info = '';
    isLive = false;
    isOnline = true;
    karmaPoints = 0;
    name = name;
    photoUrl = '';
    status = '';
    videoId = '';
  }

  String get id => _id;

  Map<String, dynamic> get data => _data;

  String get account => _data["account"];
  set account(String account) => _data["account"] = account;

  DateTime get accountCreationTime => _data["accountCreationTime"];
  set accountCreationTime(DateTime accountCreationTime) =>
      _data["accountCreationTime"] = accountCreationTime;

  String get address => _data["address"];
  set address(String address) => _data["address"] = address;

  List<dynamic> get badges => _data["badges"];
  set badges(List<dynamic> badges) => _data["badges"] = badges ?? [];

  String get chatId => _data["childId"];
  set chatId(String chatId) => _data["chatId"] = chatId;

  String get email => _data["email"];
  set email(String email) => _data["email"] = email;

  int get experiencePoints => _data["experiencePoints"];
  set experiencePoints(int experiencePoints) =>
      _data["experiencePoints"] = experiencePoints;

  List<dynamic> get featured => _data["featured"];
  set featured(List<dynamic> featured) => _data["featured"] = featured ?? [];

  List<dynamic> get followers => _data["followers"];
  set followers(List<dynamic> followers) =>
      _data["following"] = following ?? [];

  List<dynamic> get following => _data["following"];
  set following(List<dynamic> following) =>
      _data["following"] = following ?? [];

  String get info => _data["info"];
  set info(String info) => _data["info"] = info;

  bool get isLive => _data["isLive"];
  set isLive(bool isLive) => _data["isLive"] = isLive;

  bool get isOnline => _data["isOnline"];
  set isOnline(bool isOnline) => _data["isOnline"] = isOnline;

  int get karmaPoints => _data["karmaPoints"];
  set karmaPoints(int karmaPoints) => _data["karmaPoints"] = karmaPoints;

  String get name => _data["name"];
  set name(String name) => _data["name"] = name;

  String get photoUrl => _data["photoUrl"];
  set photoUrl(String photoUrl) => _data["photoUrl"] = photoUrl;

  String get playlist => _data["playlist"];
  set playlist(String playlist) => _data["playlist"] = playlist;

  List<dynamic> get scheduled => _data["scheduled"];
  set scheduled(List<dynamic> scheduled) =>
      _data["scheduled"] = scheduled ?? [];

  String get status => _data["status"];
  set status(String status) => _data["status"] = status;

  List<dynamic> get uploads => _data["uploads"];
  set uploads(List<dynamic> uploads) => _data["uploads"] = uploads ?? [];

  String get videoId => _data["videoId"];
  set videoId(String videoId) => _data["videoId"] = videoId;

  save() async {
    await _collectionRef.document(_id).updateData(_data);
  }

  static Future<User> getById(String userId) async {
    if (userId == null) return null;
    DocumentSnapshot snap =
        await _collectionRef.document(userId).snapshots().first;

    return snap.exists ? User.fromSnapshot(snap) : null;
  }
}
