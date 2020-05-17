import 'package:mobx/mobx.dart';

part 'bottom_navigation_controller.g.dart';

class BottomNavigationController = _BottomNavigationControllerBase
    with _$BottomNavigationController;

abstract class _BottomNavigationControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
