import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/widgets/drawer_button.dart';
import 'package:highvibe/modules/home/widgets/logout_button.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(this._controller);

  final HomeController _controller;

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
                    '${_controller.currentUserStore.currentUser.name}',
                    style: bold16White,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${_controller.currentUserStore.currentUser.status}',
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
                  // My Profile, My Wallet, Activity History, Bookmarks
                  DrawerButton(
                    iconPath: 'assets/ic_profile.svg',
                    title: Strings.myProfile,
                    onTap: () {
                      _closeDrawer();
                      Modular.to.pushNamed('profile');
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_wallet.svg',
                    title: Strings.myWallet,
                    onTap: () {
                      _closeDrawer();
                      Modular.to.pushNamed('profile');
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_bookmark.svg',
                    title: Strings.myMoodTracker,
                    onTap: () {
                      _closeDrawer();
                      Modular.to.pushNamed('/moodtracker');
                    }
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_activity_history.svg',
                    title: Strings.activityHistory,
                    onTap: () {
                      _closeDrawer();
                      Modular.to.pushNamed('profile');
                    },
                  ),
                  DrawerButton(
                    iconPath: 'assets/ic_bookmark.svg',
                    title: Strings.bookmarks,
                    onTap: () {
                      _closeDrawer();
                      Modular.to.pushNamed('profile');
                    },
                  ),
                ],
              ),
            ),
            LogoutButton(
              iconPath: 'assets/ic_logout.svg',
              title: Strings.logout,
              onTap: () {
                _closeDrawer();
                _controller.logout();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
