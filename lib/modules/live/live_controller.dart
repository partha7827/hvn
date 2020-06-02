import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';

part 'live_controller.g.dart';

class LiveController = _LiveControllerBase with _$LiveController;

abstract class _LiveControllerBase with Store {
  final AppController authController = Modular.get<AppController>();

  User get currentUser => authController.currentUser;

  @observable
  User currentCreator;

  @action
  Future<void> init(User user) async {
    currentCreator = user;

    final creatorId = currentCreator.liveId;
    final channelId = '$creatorId-channel';
    //ignore: unused_local_variable
    final userId = currentUser.id;

    await AgoraRtcEngine.create(agoraAppId);
    await AgoraRtcEngine.enableVideo();
    await AgoraRtcEngine.joinChannel('null', channelId, 'null', 1);
  }
}
