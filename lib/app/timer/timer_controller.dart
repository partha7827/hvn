import 'package:mobx/mobx.dart';

part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

abstract class _TimerControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
