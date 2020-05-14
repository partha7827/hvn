import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/app/app_widget.dart';
import 'package:highvibe/app/audio_player/audio_player_module.dart';
import 'package:highvibe/app/auth/auth_module.dart';
import 'package:highvibe/app/home/home_module.dart';
import 'package:highvibe/app/profile/profile_module.dart';

import 'package:highvibe/app/wallet/wallet_module.dart';
import 'package:highvibe/mocks/firebase_auth_mocks_base.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';

var isMockMode = true;

var mockDatabase = "source";

dynamic getMockFirestore() => MockCloudFirestore(mockDatabase);

dynamic getMockAuth() => MockFirebaseAuth(signedIn: true);

dynamic getFirestoreInstance() => Firestore.instance;

dynamic getAuthInstance() => FirebaseAuth.instance;

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CurrentUserStore()),
        isMockMode
            ? Bind((i) => StoreService(getMockFirestore()))
            : Bind((i) => StoreService(getFirestoreInstance())),
        isMockMode
            ? Bind((i) => AuthService(getMockAuth()))
            : Bind((i) => AuthService(getAuthInstance())),
        // Bind((i) => StoreService(isMockMode: isMockMode)),
        // Bind((i) => AuthService(isMockMode: isMockMode)),
      ];

  @override
  List<Router> get routers => [
        Router("", module: AuthModule()),
        Router("", module: HomeModule()),
        Router("", module: ProfileModule()),
        Router("", module: WalletModule()),
        Router("", module: AudioPlayerModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
