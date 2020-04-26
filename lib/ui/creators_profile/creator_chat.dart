import 'package:flutter/material.dart';

import 'message_composer.dart';

class CreatorChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MessageComposer(),
      ),
    );
  }
}
