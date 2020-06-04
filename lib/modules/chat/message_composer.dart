import 'package:flutter/material.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/custom_fab.dart';

class MessageComposer extends StatelessWidget {
  final Function sendMessage;

  MessageComposer({@required this.sendMessage});

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: Strings.typeMessage,
                          hintStyle: normal16Hint,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CustomFloatingActionButton(
              size: 48,
              child: Icon(Icons.send),
              onPressed: () {
                final content = _messageController.text.trim();
                sendMessage(content);
                _messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
