import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';

part 'broadcast_controller.g.dart';

class BroadcastController = _BroadcastControllerBase with _$BroadcastController;

abstract class _BroadcastControllerBase with Store {
  final authController = Modular.get<AuthController>();

  get currentUser => authController.currentUser;
  
  @observable
  User currentCreator;

  @action
  Future<void> init(User user) async {
    currentCreator = user;

    var creatorId = currentCreator.videoId;
    var channelId = "$creatorId-channel";
    var userId = currentUser.id;

    await AgoraRtcEngine.create(AGORA_APP_ID);
    await AgoraRtcEngine.enableVideo();
    await AgoraRtcEngine.joinChannel(null, channelId, null, userId);
  }
}