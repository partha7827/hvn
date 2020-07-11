import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
<<<<<<< HEAD
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';
import 'package:highvibe/modules/profile/achievements/achievements_module.dart';
import 'package:highvibe/modules/profile/audio/audio_module.dart';
=======
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';
import 'package:highvibe/modules/profile/achievements/achievements_module.dart';
>>>>>>> master
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_module.dart';
import 'package:highvibe/modules/profile/widgets/profile_widget.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/underline_gradient_indicator.dart';

import 'current_user_controller.dart';

class CurrentUserPage extends StatefulWidget {
  final String title;
  const CurrentUserPage({Key key, this.title = 'OtherUser'}) : super(key: key);

  @override
  _CurrentUserPageState createState() => _CurrentUserPageState();
}

class _CurrentUserPageState
    extends ModularState<CurrentUserPage, CurrentUserController>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileWidget(
      userName: controller.currentUser.name,
      userStatus: controller.currentUser.status,
      userBio: controller.currentUser.bio,
      userAvatar: controller.currentUser.photoUrl,
      userFollowersWidget: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              Text(
                controller.currentUser.followers.length.toString(),
                style: bold20White,
              ),
              Text('Followers', style: normal16Hint)
            ],
          );
        },
      ),
      userFollowingWidget: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            Text(
              controller.currentUser.following.length.toString(),
              style: bold20White,
            ),
            Text('Following', style: normal16Hint)
          ],
        );
      }),
      buttonWidget: GradientOutlineButton(
        label: Text(Strings.editProfile, style: normal16Accent),
        onPressed: () => ProfileModule.toEditProfile(),
      ),
      tabBar: TabBar(
        controller: tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicator: const UnderlineGradientIndicator(
          gradient: primaryGradientHorizontal,
          insets: EdgeInsets.symmetric(horizontal: 16),
        ),
        onTap: (index) => setState(() {}),
        tabs: [
          Tab(
<<<<<<< HEAD
            icon: Image.asset('assets/ic_badge_one.png'),
          ),
          Tab(
            icon: Image.asset('assets/ic_audio_colored.png'),
=======
            icon: tabController.index == 0
                ? Image.asset('assets/ic_audio_colored.png')
                : Image.asset('assets/ic_audio.png'),
          ),
          Tab(
            icon: tabController.index == 1
                ? Image.asset(
                    'assets/ic_playlist_active.png',
                    height: 36,
                    width: 36,
                  )
                : Image.asset(
                    'assets/ic_playlist_inactive.png',
                    height: 36,
                    width: 36,
                  ),
          ),
          Tab(
            icon: tabController.index == 2
                ? Image.asset(
                    'assets/ic_stats_and_reward_active.png',
                    height: 36,
                    width: 36,
                  )
                : Image.asset(
                    'assets/ic_stats_and_reward_inactive.png',
                    height: 36,
                    width: 36,
                  ),
>>>>>>> master
          ),
          Tab(
            icon: SvgPicture.asset(
              'assets/ic_playlist.svg',
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
      tabView: TabBarView(
        controller: tabController,
        children: <Widget>[
          AchievementsModule(controller.currentUser),
<<<<<<< HEAD
          AudioModule(controller.currentUser.id),
          ShowPlaylistsModule(controller.currentUser.id),
=======
          ShowAudioModule(controller.currentUser.id),
          ShowPlaylistsModule(userId: controller.currentUser.id),
>>>>>>> master
        ],
      ),
    );
  }
}
