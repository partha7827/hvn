import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';
import 'package:highvibe/modules/profile/achievements/achievements_module.dart';
import 'package:highvibe/modules/profile/audio/audio_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/widgets/profile_widget.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'package:highvibe/widgets/underline_gradient_indicator.dart';
import 'other_user_controller.dart';

class OtherUserPage extends StatefulWidget {
  @override
  _OtherUserPageState createState() => _OtherUserPageState();
}

class _OtherUserPageState
    extends ModularState<OtherUserPage, OtherUserController>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.otherUser != null
          ? buildProfileWidget()
          : const SplashWidget(),
    );
  }

  Widget buildProfileWidget() {
    return ProfileWidget(
      userName: controller.otherUser.name,
      userStatus: controller.otherUser.status,
      userBio: controller.otherUser.bio,
      userAvatar: controller.otherUser.photoUrl,
      userFollowersWidget: Observer(builder: (_) {
        return InkWell(
          onTap: () {
            if (controller.followers.isNotEmpty) {
              ProfileModule.toFollowers(controller.followers);
            }
          },
          child: Column(
            children: <Widget>[
              Text(
                controller.followers.length.toString(),
                style: bold20White,
              ),
              Text('Followers', style: normal16Hint)
            ],
          ),
        );
      }),
      userFollowingWidget: Observer(builder: (_) {
        return InkWell(
          onTap: () {
            if (controller.following.isNotEmpty) {
              ProfileModule.toFollowing(controller.following);
            }
          },
          child: Column(
            children: <Widget>[
              Text(
                controller.following.length.toString(),
                style: bold20White,
              ),
              Text('Following', style: normal16Hint)
            ],
          ),
        );
      }),
      buttonWidget: GradientOutlineButton(
        label: Observer(
          builder: (_) => Text(
            controller.isFollowing ? Strings.unfollow : Strings.follow,
            style: normal16Accent,
          ),
        ),
        onPressed: controller.followUser,
      ),
      tabBar: TabBar(
        controller: tabController,
        onTap: (value) {
          setState(() {});
        },
        indicator: const UnderlineGradientIndicator(
          gradient: primaryGradientHorizontal,
          insets: EdgeInsets.symmetric(horizontal: 16),
        ),
        tabs: [
          Tab(
            icon: tabController.index == 0
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
          ),
          Tab(
            icon: tabController.index == 1
                ? Image.asset('assets/ic_audio_colored.png')
                : Image.asset('assets/ic_audio.png'),
          ),
          Tab(
            icon: tabController.index == 2
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
        ],
      ),
      tabView: TabBarView(
        controller: tabController,
        children: <Widget>[
          AudioModule(controller.otherUser.id),
          ShowPlaylistsModule(controller.otherUser.id),
          AchievementsModule(controller.otherUser),
        ],
      ),
    );
  }
}
