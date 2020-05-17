import 'package:flutter/widgets.dart';
import 'package:highvibe/mocks/firebase_auth_mocks_base.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:highvibe/mocks/mock_database.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double aspectRatio(BuildContext context) =>
    screenWidth(context) / screenHeight(context);

String mediaTimeFormarter(Duration d) =>
    d.toString().split('.').first.padLeft(8, '0');


dynamic getMockFirestore() => MockCloudFirestore(mockDatabase);

dynamic getMockAuth() => MockFirebaseAuth(signedIn: true);

dynamic getFirestoreInstance() => Firestore.instance;

dynamic getAuthInstance() => FirebaseAuth.instance;
