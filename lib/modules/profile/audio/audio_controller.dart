import 'package:mobx/mobx.dart';

part 'audio_controller.g.dart';

class AudioController = _AudioControllerBase with _$AudioController;

abstract class _AudioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
