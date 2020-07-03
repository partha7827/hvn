import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/audio_player/audio_player_module.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

import 'media_overlays_mixin.dart';

part 'app_controller.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class OverlayEntryContainer {
  OverlayEntry overlay;
}

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase extends OverlayEntryContainer
    with Store, MediaOverlaysMixin {
  final AuthService auth = Modular.get<AuthService>();

  final FirestoreService firestore = Modular.get<FirestoreService>();

  @override
  @observable
  OverlayEntry overlay;

  @observable
  AuthState authState = AuthState.initial;

  @observable
  User currentUser;

  @action
  Future<void> setCurrentUser(User user) async {
    if (user != null) {
      currentUser = user;
      authState = AuthState.authenticated;
    } else {
      authState = AuthState.unauthenticated;
    }
  }

  void setUserOnline(bool active) {
    if (currentUser != null) {
      firestore.userCollection.document(currentUser.id).updateData({
        'isOnline': active,
        // "lastTimeSeen": serializers.serialize(DateTime.now().toUtc())
      });
    }
  }
}
