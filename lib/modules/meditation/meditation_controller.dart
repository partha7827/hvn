import 'package:mobx/mobx.dart';

part 'meditation_controller.g.dart';

class MeditationController = _MeditationControllerBase
    with _$MeditationController;

abstract class _MeditationControllerBase with Store {
  @observable
  int numRounds = 3;
  @observable
  int breathsPerRound = 35;
  @observable
  int holdTime = 120;
  @observable
  int speed = 6;

  @action
  void setNumRounds(int n) => numRounds = n;

  @action
  void setBreathsPerRound(int n) => breathsPerRound = n;

  @action
  void setHoldTime(int n) => holdTime = n;

  @action
  void setSpeed(int n) => speed = n;
}