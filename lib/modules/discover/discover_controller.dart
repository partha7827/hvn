import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/models/user/user.dart';
import 'package:hvn/services/store_service.dart';
import 'package:mobx/mobx.dart';

part 'discover_controller.g.dart';

class DiscoverController = _DiscoverController with _$DiscoverController;

abstract class _DiscoverController with Store {
  final firestore = Modular.get<StoreService>();

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
