import 'package:mobx/mobx.dart';

part 'meditation_controller.g.dart';

class MeditationController = _MeditationControllerBase
    with _$MeditationController;

abstract class _MeditationControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
