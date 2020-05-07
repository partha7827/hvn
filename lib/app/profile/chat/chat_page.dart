import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as Chat;
import 'chat_controller.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_fab.dart';

class ChatPage extends StatefulWidget {
  final String title;
  final User user;
  const ChatPage({Key key, this.user, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    controller.init(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Observer(
        builder: (_) => controller.client != null
            ? Chat.StreamChat(
                client: controller.client,
                child: Chat.StreamChannel(

                  channel: controller.channel,
                  child: ChannelPage(),
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ChannelListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat.ChannelsBloc(
        child: Chat.ChannelListView(
          filter: {
            'members': {
              '\$in': [Chat.StreamChat.of(context).user.id],
            }
          },
          sort: [Chat.SortOption('last_message_at')],
          pagination: Chat.PaginationParams(
            limit: 20,
          ),
          channelWidget: ChannelPage(),
        ),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Chat.MessageListView(
                  showVideoFullScreen: false,
                  threadBuilder: (_, parentMessage) {
                    return ThreadPage(
                      parent: parentMessage,
                    );
                  },
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4,
                    ),
                    child: Chat.TypingIndicator(
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Chat.MessageInput(),
          // MessageComposer()
        ],
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  final Chat.Message parent;

  ThreadPage({
    Key key,
    this.parent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Chat.ThreadHeader(
        parent: parent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Chat.MessageListView(
              parentMessage: parent,
            ),
          ),
          if (parent.type != 'deleted')
            Chat.MessageInput(
              parentMessage: parent,
            ),
        ],
      ),
    );
  }
}

class MessageComposer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        style: normal16White,
                        decoration: InputDecoration(
                          hintText: Strings.typeMessage,
                          hintStyle: normal16Hint,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CustomFloatingActionButton(
              child: Icon(Icons.send),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
