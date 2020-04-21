import 'package:mobx/mobx.dart';

part 'donations_controller.g.dart';

class DonationsController = _DonationsControllerBase with _$DonationsController;

abstract class _DonationsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
