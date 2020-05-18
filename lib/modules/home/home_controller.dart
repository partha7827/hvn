import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:mobx/mobx.dart';

import 'package:highvibe/models/models.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final appStore = Modular.get<AppStore>();

  final authService = Modular.get<AuthService>();

  final firestore = Modular.get<StoreService>();

  get currentUser => appStore.currentUser.toString();

  @action
  Future<void> logout() async {
    await authService.logout();

    appStore.setCurrentUser(null);
  }

  @action
  Future<List<Video>> getVideos() async {
    print("get videos");

    final querySnapshot = await firestore.videoCollection.getDocuments();

    return Video.parseListOfVideos(querySnapshot).toList();
  }

  @action
  Future<List<User>> getAuthors() async {
    print("get authors");

    final querySnapshot = await firestore.userCollection
        .where("isRecommended", isEqualTo: "true")
        .getDocuments();

    return User.parseListOfUsers(querySnapshot).toList();
  }
}
