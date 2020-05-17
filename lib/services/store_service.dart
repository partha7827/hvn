import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StoreService extends Disposable {
  dynamic firestore;
  
  StoreService(this.firestore) {
    _userCollection = firestore.collection("users");
    _messageCollection = firestore.collection("messages");
    _tagCollection = firestore.collection("tags");
  }

  CollectionReference _userCollection;
  CollectionReference _messageCollection;
  CollectionReference _tagCollection;

  CollectionReference get userCollection => _userCollection;
  CollectionReference get messageCollection => _messageCollection;
  CollectionReference get tagCollection => _tagCollection;

  //dispose will be called automatically
  @override
  void dispose() {}
}
