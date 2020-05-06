import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/audio_player/models/models.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';

part 'live_controller.g.dart';

class LiveController = _LiveControllerBase with _$LiveController;

abstract class _LiveControllerBase with Store {
  final authController = Modular.get<CurrentUserStore>();

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
