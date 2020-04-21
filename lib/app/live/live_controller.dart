import 'package:mobx/mobx.dart';

part 'live_controller.g.dart';

class LiveController = _LiveControllerBase with _$LiveController;

abstract class _LiveControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
