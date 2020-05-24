import 'package:mobx/mobx.dart';

part 'discover_controller.g.dart';

class DiscoverController = _DiscoverController with _$DiscoverController;

abstract class _DiscoverController with Store {
  @observable
  int selectedTab = 0;

  @action
  void selectTab(int index) {
    selectedTab = index;
  }
}
