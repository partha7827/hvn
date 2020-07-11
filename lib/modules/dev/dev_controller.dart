import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:mobx/mobx.dart';

part 'dev_controller.g.dart';

class DevController = _DevControllerBase with _$DevController;

abstract class _DevControllerBase with Store {
  final AppController appStore = Modular.get<AppController>();

  @action
  void init() {
    appStore.setCurrentUser(mockUser);
  }
}
