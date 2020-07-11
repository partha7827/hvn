import 'package:built_collection/built_collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';
part 'users_list_controller.g.dart';

class UsersListController = _UsersListControllerBase with _$UsersListController;

abstract class _UsersListControllerBase with Store {
  final FirestoreService firestore = Modular.get<FirestoreService>();

  final List<String> userIds;
  _UsersListControllerBase(this.userIds);

  @observable
  ObservableFuture<BuiltList<User>> users;

  @action
  void loadUsers() {
    if (userIds.isNotEmpty) {
      users = ObservableFuture(
        firestore.userCollection
            .where('id', whereIn: userIds)
            .getDocuments()
            .then((s) => User.parseListOfUsers(s)),
      );
    } else {
      users = ObservableFuture.value(BuiltList.of([]));
    }
  }
}
