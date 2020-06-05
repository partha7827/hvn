import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/widgets/drawer_button.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';

class DrawerWidget extends StatelessWidget {
  void _closeDrawer() {
    Modular.to.pop();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF202340),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 62,
                    height: 62,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: primaryGradient,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/ic_avatar.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    Strings.dummyName,
                    style: bold16White,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    Strings.dummyName,
                    style: normal14Hint,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
              child: Column(
                children: [
                  DrawerButton(
                    iconPath: 'assets/ic_time.svg',
                    title: Strings.meditationTimer,
                    onTap: () {
                      _closeDrawer();
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_activity_history.svg',
                    title: Strings.activityHistory,
                    onTap: () {
                      _closeDrawer();
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_mood.svg',
                    title: Strings.moodTracker,
                    onTap: () {
                      _closeDrawer();
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_wallet.svg',
                    title: Strings.wallet,
                    onTap: () {
                      _closeDrawer();
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_invite.svg',
                    title: Strings.inviteFriends,
                    onTap: () {
                      _closeDrawer();
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_settings.svg',
                    title: Strings.settings,
                    onTap: () {
                      _closeDrawer();
                    },
                  ),
                ],
              ),
            ),
            DrawerButton(
              iconPath: 'assets/ic_logout.svg',
              title: Strings.logout,
              isLogout: true,
              onTap: () {
                _closeDrawer();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
