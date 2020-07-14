import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';
import 'package:highvibe/modules/profile/achievements/achievements_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_module.dart';
import 'package:highvibe/modules/profile/widgets/build_tabs_header.dart';
import 'package:highvibe/modules/profile/widgets/profile_widget.dart';
import 'package:highvibe/values/strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/splash_widget.dart';
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
      tabBar: buildTabsHeader(tabController),
      tabView: TabBarView(
        controller: tabController,
        children: <Widget>[
          AchievementsModule(controller.otherUser),
          ShowAudioModule(controller.otherUser.id),
          ShowPlaylistsModule(userId: controller.otherUser.id),
        ],
      ),
    );
  }
}
