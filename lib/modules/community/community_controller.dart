import 'package:mobx/mobx.dart';

part 'community_controller.g.dart';

class CommunityController = _CommunityControllerBase with _$CommunityController;

abstract class _CommunityControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
