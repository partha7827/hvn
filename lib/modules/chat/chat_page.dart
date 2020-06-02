import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/message/message.dart';
import 'package:highvibe/models/models.dart' show User;
import 'package:highvibe/modules/chat/chat_controller.dart';
import 'package:highvibe/modules/chat/single_message_tile.dart';
import 'package:highvibe/values/themes.dart';

import 'message_composer.dart';

class ChatPage extends StatefulWidget {
  final String title;
  final User user;
  const ChatPage({Key key, this.user, this.title = 'Chat'}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getChannelMessages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.documents.isEmpty) {
            return Center(
              child: Text(
                'No messages available',
                style: bold16White,
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              final message =
                  Message.fromSnapshot(snapshot.data.documents[index]);

              return SingleMessageTile(
                message: message,
              );
            },
          );
        },
      ),
      bottomNavigationBar: MessageComposer(
        sendMessage: controller.sendMessage,
      ),
    );
  }
}
