import 'package:mobx/mobx.dart';

part 'broadcast_controller.g.dart';

class BroadcastController = _BroadcastControllerBase with _$BroadcastController;

abstract class _BroadcastControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
