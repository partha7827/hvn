import 'package:mobx/mobx.dart';

part 'explore_controller.g.dart';

class ExploreController = _ExploreControllerBase with _$ExploreController;

abstract class _ExploreControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
