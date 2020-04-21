import 'package:mobx/mobx.dart';

part 'tribe_controller.g.dart';

class TribeController = _TribeControllerBase with _$TribeController;

abstract class _TribeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
