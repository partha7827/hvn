import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/audio/audio_module.dart';
import 'package:highvibe/modules/profile/profile_module.dart';
import 'package:highvibe/modules/profile/widgets/profile_avatar.dart';
import 'package:highvibe/modules/profile/widgets/profile_tab_buttons.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/image_viewer.dart';
import 'package:highvibe/widgets/splash_widget.dart';
import 'other_user_controller.dart';

class OtherUserPage extends StatefulWidget {
  final String title;
  const OtherUserPage({Key key, this.title = 'OtherUser'}) : super(key: key);

  @override
  _OtherUserPageState createState() => _OtherUserPageState();
}

class _OtherUserPageState
    extends ModularState<OtherUserPage, OtherUserController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  double top = 0.0;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => controller.otherUser != null
            ? buildProfilePage()
            : const SplashWidget(),
      ),
    );
  }

  void _showEditProfile() {
    Modular.to.pushNamed('/editProfile');
  }

  Widget buildProfilePage() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              expandedHeight: 300,
              floating: false,
              pinned: true,
              backgroundColor: secondaryColor,
              leading: const BackButton(
                onPressed: ProfileModule.toHome,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: _showEditProfile,
                ),
              ],
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    stretchModes: [
                      StretchMode.fadeTitle,
                    ],
                    title: Opacity(
                      opacity: top > 100 ? 0 : 1,
                      child: Text(
                        controller.otherUser.name,
                        style: bold20White,
                      ),
                    ),
                    background: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppBar(
                            backgroundColor: Colors.transparent,
                            leading: Container(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => ProfileModule.toAvatarPicture(
                                  ImageViewerArguments(
                                    heroTag:
                                        'author#${controller.otherUser.id}',
                                    imageUrl: controller.otherUser.photoUrl,
                                  ),
                                ),
                                child: Hero(
                                  tag: 'author#${controller.otherUser.id}',
                                  child: ProfileAvatar(
                                      controller.otherUser.photoUrl),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      controller.otherUser.name,
                                      style: bold20White,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        controller.otherUser.status,
                                        style: normal16Hint,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: GradientOutlineButton(
                                          label: Observer(
                                            builder: (_) => Text(
                                              controller.isFollowing
                                                  ? Strings.unfollow
                                                  : Strings.follow,
                                              style: normal16Accent,
                                            ),
                                          ),
                                          onPressed: controller.followUser,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              controller.otherUser.bio,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: normal16Hint,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Observer(builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    if (controller.followers.isNotEmpty) {
                                      ProfileModule.toFollowers(
                                          controller.followers.toList());
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
                              Observer(builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    if (controller.following.isNotEmpty) {
                                      ProfileModule.toFollowing(
                                          controller.following.toList());
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
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
          ProfileTabButtons(controller: _tabController),
        ];
      },
      body: AudioModule(controller.otherUser.id),
    );
  }
}
