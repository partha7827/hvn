import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/mood_tracker/mood_tracker_controller.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

class MoodTrackerPage extends StatefulWidget {
  @override
  _MoodTrackerPageState createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState
    extends ModularState<MoodTrackerPage, MoodTrackerController> {
  final List<String> emojiPathList = [
    'assets/emoji/ic_ecstatic.png',
    'assets/emoji/ic_happy.png',
    'assets/emoji/ic_excited.png',
    'assets/emoji/ic_grateful.png',
    'assets/emoji/ic_relaxed.png',
    'assets/emoji/ic_content.png',
    'assets/emoji/ic_unsure.png',
    'assets/emoji/ic_bored.png',
    'assets/emoji/ic_anxious.png',
    'assets/emoji/ic_angry.png',
    'assets/emoji/ic_stressed.png',
    'assets/emoji/ic_sad.png',
  ];
  final List<String> emojiNameList = [
    Strings.ecstatic,
    Strings.happy,
    Strings.excited,
    Strings.grateful,
    Strings.relaxed,
    Strings.content,
    Strings.unsure,
    Strings.bored,
    Strings.anxious,
    Strings.angry,
    Strings.stressed,
    Strings.sad,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Modular.to.pop(),
          ),
          actions: <Widget>[
            IconButton(
              icon:
                  SvgPicture.asset('assets/ic_date.svg', height: 24, width: 24),
              onPressed: null,
            ),
          ]),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                Strings.goodMorning,
                style: bold20PlayfairWhite,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              margin: const EdgeInsets.only(
                bottom: 26.0,
              ),
              child: Text(
                'Rebecca!',
                style: bold30PlayfairWhite,
              ),
            ),
            _buildEmojiWidget(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildEmojiWidget(BuildContext context) {
    return Expanded(
      child: Container(
        width: screenWidth(context),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 26,
              ),
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                Strings.howAreYouFeeling,
                style: bold20PlayfairWhite,
              ),
            ),
            _buildEmojiGrid(),
          ],
        ),
      ),
    );
  }

  Expanded _buildEmojiGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(emojiPathList.length, (index) {
          return _emojiWidget(index);
        }),
      ),
    );
  }

  Center _emojiWidget(int index) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 60,
              width: 60,
              child: Image.asset(emojiPathList[index]),
            ),
            Text(
              emojiNameList[index],
              style: normal14White,
            )
          ],
        ),
      ),
    );
  }
}
