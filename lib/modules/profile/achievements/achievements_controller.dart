import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:mobx/mobx.dart';

part 'achievements_controller.g.dart';

class AchievementsController = _AchievementsControllerBase
    with _$AchievementsController;

abstract class _AchievementsControllerBase with Store {
  final User user;
  _AchievementsControllerBase(this.user);

  final User currentUser = Modular.get<AppController>().currentUser;
  
  @computed
  String get something => user.karmaPoints.toString();
  
  List<String> get badges => user.badges.toList();
  String get karmaPoints => user.karmaPoints.toString();
  String get experiencePoints => user.experiencePoints.toString();
  String get hvnEarned => user.hvnEarned.toString();
  String get sessionCount => user.sessionCount.toString();
  String get currentStreak => user.currentStreak.toString();
  String get questCompletion => user.questCompletion.toString();
  bool get showShareButton => user.id == currentUser.id;

  @action
  void share() {}
}