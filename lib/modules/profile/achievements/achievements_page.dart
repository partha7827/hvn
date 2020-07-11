import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'achievements_controller.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage();

  @override
  _AchievementsPageState createState() => _AchievementsPageState();
}

class _AchievementsPageState
    extends ModularState<AchievementsPage, AchievementsController> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(body: buildAchievements());
  }

  Widget buildAchievements() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderRow(title: Strings.achievements),
=======
    return Scaffold(body: _buildAchievements());
  }

  Widget _buildAchievements() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 8),
      child: ListView(
        children: [
          const HeaderRow(title: Strings.achievements),
>>>>>>> master
          _badges(),
          _userPoints(),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _profileStatsWidget(
                        controller.hvnEarned, Strings.hvnEarned),
                    _profileStatsWidget(
                        controller.sessionCount, Strings.sessionCount),
                    _profileStatsWidget(
                        controller.currentStreak, Strings.currentStreak),
                    _profileStatsWidget(
                        controller.questCompletion, Strings.questCompletion),
                  ],
                ),
              ],
            ),
          ),
          if (controller.showShareButton)
            Container(
              alignment: Alignment.center,
<<<<<<< HEAD
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
=======
              margin: const EdgeInsets.symmetric(vertical: 20),
>>>>>>> master
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: GradientOutlineButton(
                  label: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Text(
                      Strings.shareYourStats,
                      style: normal16Accent,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    'assets/ic_share.svg',
                    color: accentColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _userPoints() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryLightColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _tokenWidget(
            'assets/ic_karma.png',
            controller.karmaPoints,
            Strings.karma,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            width: 1,
            color: hintTextColor,
          ),
          _tokenWidget(
            'assets/ic_experience_points.png',
            controller.experiencePoints,
            Strings.experiencePoint,
          ),
        ],
      ),
    );
  }

  Widget _badges() {
    return controller.badges.isNotEmpty
        ? Container(
            height: 80,
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.badges.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(controller.badges[index]),
                );
              },
            ),
          )
        : Container();
  }

  Widget _tokenWidget(String path, String title, String subTitle) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(path),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: bold24White),
                Text(subTitle, style: normal10Hint),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileStatsWidget(String value, String label) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              value ?? '',
              style: bold24White,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                label ?? '',
                textAlign: TextAlign.center,
                style: normal14Hint,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
