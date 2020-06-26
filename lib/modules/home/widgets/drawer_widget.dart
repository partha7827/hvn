import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/widgets/drawer_button.dart';
import 'package:highvibe/modules/home/widgets/logout_button.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';

class DrawerWidget extends StatelessWidget {
  final _controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
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
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: CachedNetworkImageProvider(
                      _controller.currentUserStore.currentUser.photoUrl,
                    ),
                  ),
                ),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${_controller.currentUserStore.currentUser.name}',
                      style: bold24White,
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
                        Modular.to.pushNamed('wallet');
                      },
                    ),
                    DrawerButton(
                      iconPath: 'assets/ic_bookmark.svg',
                      title: Strings.myJournal,
                      onTap: () {
                        _closeDrawer();
                        Modular.to.pushNamed('journal');
                      },
                    ),
                    DrawerButton(
                        iconPath: 'assets/ic_activity_history.svg',
                        title: Strings.myMoodTracker,
                        onTap: () {
                          _closeDrawer();
                          Modular.to.pushNamed('/moodtracker');
                        }),
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
      ),
    );
  }

  void _closeDrawer() {
    Modular.to.pop();
  }
}
