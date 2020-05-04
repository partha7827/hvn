import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';

part 'broadcast_controller.g.dart';

class BroadcastController = _BroadcastControllerBase with _$BroadcastController;

abstract class _BroadcastControllerBase with Store {
  @action
  Future<void> init() async {
    var creatorId = 1;
    var channelId = "$creatorId-channel"; // "creatorId";
    var userId = 0; // assign automatically // "userId";

    await AgoraRtcEngine.create(AGORA_APP_ID);
    await AgoraRtcEngine.enableVideo();
    await AgoraRtcEngine.joinChannel(null, channelId, null, userId);

    print("joined");
  }
}
