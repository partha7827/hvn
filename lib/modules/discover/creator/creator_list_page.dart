import 'package:flutter/material.dart';
import 'package:highvibe/modules/discover/creator/creator_card.dart';

class CreatorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.only(bottom: 40),
      itemBuilder: (context, index) {
        return CreatorCard();
      },
    );
  }
}
