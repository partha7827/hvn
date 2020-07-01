import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/models/models.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService auth = Modular.get<AuthService>();
  final AppController currentUserStore = Modular.get<AppController>();
  final AppController app = Modular.get<AppController>();

  @observable
  ObservableFuture<BuiltList<Audio>> audios;

  @observable
  ObservableFuture<BuiltList<Video>> videos;

  @observable
  ObservableFuture<BuiltList<User>> authors;

  @action
  ObservableFuture<BuiltList<Audio>> loadRecommendedAudios() {
    return audios = ObservableFuture(
      firestore.audioCollection
          //.where("tags", arrayContains: "recommended")
          .where('isRecommended', isEqualTo: true)
          .getDocuments()
          .then((s) => Audio.parseListOfAudios(s)),
    );
  }

  @action
  ObservableFuture<BuiltList<Video>> loadRecommendedVideos() {
    return videos = ObservableFuture(
      firestore.videoCollection
          // .where("tags", arrayContains: "recommended")
          .where('isRecommended', isEqualTo: true)
          .getDocuments()
          .then((s) => Video.parseListOfVideos(s)),
    );
  }

  @action
  ObservableFuture<BuiltList<User>> loadRecommendedAuthors() {
    return authors = ObservableFuture(
      firestore.userCollection
          // .where("tags", arrayContains: "recommended")
          .where('isRecommended', isEqualTo: true)
          .getDocuments()
          .then((s) => User.parseListOfUsers(s)),
    );
  }

  @action
  Future<void> logout() async {
    await auth.logout();
    await currentUserStore.setCurrentUser(null);
  }

  void toAudioPlayer({ BuildContext context, Audio audioFile }) {
    app.toAudioPlayer(context: context, audioFile: audioFile);
  }
}
