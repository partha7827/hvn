import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/chat/chat_controller.dart';
import 'package:highvibe/modules/chat/chat_page.dart';

class ChatModule extends WidgetModule {
  static Inject<ChatModule> get to => Inject<ChatModule>.of();

  final String channelId;

  ChatModule(this.channelId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ChatController(channelId), singleton: false),
      ];

  @override
  Widget get view => const ChatPage();
}
