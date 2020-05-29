import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/profile/profile_module.dart';
import 'package:hvn/modules/profile/widgets/profile_avatar.dart';
import 'package:hvn/modules/profile/widgets/profile_tab_buttons.dart';
import 'package:hvn/modules/profile/widgets/profile_tab_pages.dart';
import 'package:hvn/values/Strings.dart';
import 'package:hvn/values/themes.dart';
import 'package:hvn/widgets/gradient_outline_button.dart';
import 'other_user_controller.dart';

class OtherUserPage extends StatefulWidget {
  final String title;
  const OtherUserPage({Key key, this.title = "OtherUser"}) : super(key: key);

  @override
  _OtherUserPageState createState() => _OtherUserPageState();
}

class _OtherUserPageState
    extends ModularState<OtherUserPage, OtherUserController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var top = 0.0;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildProfilePage(),
    );
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
              leading: BackButton(
                onPressed: ProfileModule.toHome,
              ),
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
                              Hero(
                                tag: "author#${controller.otherUser.id}",
                                child: ProfileAvatar(
                                    controller.otherUser.photoUrl),
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
                                    if (controller.followers.length > 0)
                                      ProfileModule.toFollowers(
                                          controller.followers);
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
                                    if (controller.following.length > 0)
                                      ProfileModule.toFollowing(
                                          controller.following);
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
      body: ProfileTabPages(
          userId: controller.otherUser.id, controller: _tabController),
    );
  }
}
