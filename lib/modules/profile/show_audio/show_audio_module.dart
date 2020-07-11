import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_controller.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

class ShowAudioModule extends WidgetModule {
  final String userId;

  ShowAudioModule(this.userId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthService.withFirebase()),
        Bind((i) => FirestoreService.withFirebase()),
        Bind((i) => ShowAudioController(userId)),
      ];

  @override
  Widget get view => ShowAudioPage();
}
