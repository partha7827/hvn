import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'discover_controller.g.dart';

class DiscoverController = _DiscoverController with _$DiscoverController;

abstract class _DiscoverController with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController appController = Modular.get<AppController>();

  @observable
  int selectedTab = 0;

  @action
  void selectTab(int index) {
    selectedTab = index;
  }

  @action
  void loadCreators() {
    creators = ObservableFuture(
      firestore.userCollection
          .getDocuments()
          .then((s) => User.parseListOfUsers(s).toList()),
    );
  }

  ObservableFuture<List<User>> creators;
}
