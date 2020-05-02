import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_controller.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_fab.dart';


class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MessageComposer(),
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
