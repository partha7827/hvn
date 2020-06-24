import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show required;

class FirestoreApiService {
  static final instance = FirestoreApiService._();

  FirestoreApiService._();

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T Function(Map<String, Object> data, String documentId) builder,
    Query Function(Query query) queryBuilder,
    int Function(T lhs, T rhs) sort,
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data, snapshot.documentID))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Future<void> deleteData({@required String path}) async {
    final reference = Firestore.instance.document(path);
    print('delete: $path');
    await reference.delete();
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T Function(Map<String, Object> data, String documentID) builder,
  }) {
    final reference = Firestore.instance.document(path);
    final snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data, snapshot.documentID));
  }

  Future<void> setData({
    @required String path,
    @required Map<String, Object> data,
  }) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data);
  }
}
