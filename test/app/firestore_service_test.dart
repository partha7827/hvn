import 'package:highvibe/services/store_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:highvibe/models/serializer/serializer.dart';

main() async {
  final database = """
      { "users": { "first": { "name": "username" } } }
    """;

  final firestore = MockCloudFirestore(database);

  final service = StoreService(firestore);

  test("initialize store service", () async {
    expect(service.userCollection, isInstanceOf<CollectionReference>());
  });

  test("get user document", () async {
    var document = await service.userCollection.document("first").get();

    expect(document.data, equals({'name': 'username'}));
  });
}
