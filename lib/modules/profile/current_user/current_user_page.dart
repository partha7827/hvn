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
      tabBar: buildTabsHeader(tabController),
      tabView: TabBarView(
        controller: tabController,
        children: <Widget>[
          AchievementsModule(controller.currentUser),
          ShowAudioModule(controller.currentUser.id),
          ShowPlaylistsModule(userId: controller.currentUser.id),
        ],
      ),
    );
  }
}
