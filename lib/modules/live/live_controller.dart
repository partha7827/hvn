import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';

part 'live_controller.g.dart';

class LiveController = _LiveControllerBase with _$LiveController;

abstract class _LiveControllerBase with Store {
  final authController = Modular.get<AppStore>();

  get currentUser => authController.currentUser;

  @observable
  User currentCreator;

  @action
  Future<void> init(User user) async {
    currentCreator = user;

    var creatorId = currentCreator.liveId;
    var channelId = "$creatorId-channel";
    //ignore: unused_local_variable
    var userId = currentUser.id;

    await AgoraRtcEngine.create(AGORA_APP_ID);
    await AgoraRtcEngine.enableVideo();
    await AgoraRtcEngine.joinChannel('null', channelId, 'null', 1);
  }
}
