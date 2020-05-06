import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/app/profile/audio/audio_page.dart';
import 'package:highvibe/app/profile/broadcast/broadcast_page.dart';
import 'package:highvibe/app/profile/chat/chat_page.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/bottom_navigation.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/underline_gradient_indicator.dart';
import 'other_user_controller.dart';

class OtherUserPage extends StatefulWidget {
  final String title;
  final String userId;
  const OtherUserPage({Key key, this.userId, this.title = "OtherUser"})
      : super(key: key);

  @override
  _OtherUserPageState createState() => _OtherUserPageState();
}

class _OtherUserPageState
    extends ModularState<OtherUserPage, OtherUserController>
    with SingleTickerProviderStateMixin {
  User get user => controller.otherUser;

  @override
  void initState() {
    super.initState();
    controller.init(widget.userId);
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return user == null
        ? CircularProgressIndicator()
        : Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 300,
                    floating: false,
                    pinned: true,
                    backgroundColor: secondaryColor,
                    title: Text(
                      user?.account ?? 'account',
                      style: bold18White,
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: SvgPicture.asset('assets/ic_wallet.svg'),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/ic_notification.svg'),
                        onPressed: () {},
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      stretchModes: [
                        StretchMode.fadeTitle,
                      ],
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
                                Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    gradient: primaryGradient,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 105,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: user.photoUrl ?? "",
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        user.name ?? 'username',
                                        style: bold20White,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          user.status ?? 'status',
                                          style: normal16Hint,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: <Widget>[
                                            GradientOutlineButton(
                                              icon: SvgPicture.asset(
                                                  'assets/ic_donate.svg'),
                                              onPressed: () {},
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                child: GradientOutlineButton(
                                                  label: Text(
                                                    Strings.follow,
                                                    style: normal16Accent,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                          ],
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
                                user.info ?? 'info',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: normal16Hint,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "${user.followers.length ?? 0}",
                                      style: bold20White,
                                    ),
                                    Text('Followers', style: normal16Hint)
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "${user.following.length ?? 0}",
                                      style: bold20White,
                                    ),
                                    Text('Following', style: normal16Hint)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      color: primaryLightColor,
                      tabBar: TabBar(
                        controller: _tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicator: UnderlineGradientIndicator(
                          gradient: primaryGradientHorizontal,
                          insets: const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        tabs: [
                          Tab(
                            icon: Image.asset(_tabController.index == 0
                                ? 'assets/ic_audio_colored.png'
                                : 'assets/ic_audio.png'),
                          ),
                          Tab(icon: SvgPicture.asset('assets/ic_chat.svg')),
                          Tab(
                              icon: SvgPicture.asset(
                                  'assets/ic_broadcasting.svg')),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  AudioPage(user: user),
                  ChatPage(user: user),
                  BroadcastPage(user: user),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({this.tabBar, this.color});

  final TabBar tabBar;
  final Color color;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
      color: color,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}