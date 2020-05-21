import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/chat/chat_controller.dart';
import 'package:highvibe/modules/chat/chat_page.dart';

class ChatModule extends WidgetModule {
  final String channelId;

  ChatModule(this.channelId);

  @override
  List<Bind> get binds => [
        Bind((i) => ChatController(channelId)),
      ];

  @override
  Widget get view => ChatPage();
}
