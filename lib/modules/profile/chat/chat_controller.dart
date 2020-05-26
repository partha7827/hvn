import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/values/config.dart';
import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as Chat;

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final authController = Modular.get<AppStore>();

  @observable
  Chat.Client client;

  @observable
  Chat.Channel channel;

  @observable
  User currentCreator;

  User get currentUser => authController.currentUser;

  @action
  Future<void> init(User user) async {
    currentCreator = user;

    client = Chat.Client(
      STREAM_API_KEY,
    );

    var creatorId = currentCreator.chatId;
    var userId = currentUser.id;
    var userToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoidXNlcjEifQ.NGZPyPMx7KSVisJmh4tJhOIv7ZjCaMQpOh4gTINvCaU';

    await client.setUser(Chat.User(id: userId), userToken);

    channel = client.channel('messaging', id: creatorId);

    channel.watch();
  }
}
