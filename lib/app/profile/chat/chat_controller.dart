import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  @observable
  Client client;

  @observable
  Channel channel;
  
  @action
  Future<void> init() async {
    final c = Client(
      STREAM_API_KEY,
    );

    var creatorId = 'user2';
    var userId = 'user1';
    var userToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidXNlcjEifQ.NGZPyPMx7KSVisJmh4tJhOIv7ZjCaMQpOh4gTINvCaU';

    await c.setUser(User(id: userId), userToken);

    client = c;

    channel = client.channel('messaging', id: creatorId);

    print("channel created");

    channel.watch();
  }
}
