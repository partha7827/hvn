import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:highvibe/app/profile/widgets/creator_audio.dart';
import 'package:highvibe/app/profile/widgets/creator_broadcast.dart';
import 'package:highvibe/app/profile/widgets/creator_chat.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:highvibe/values/themes.dart';
import 'package:highvibe/widgets/gradient_outline_button.dart';
import 'package:highvibe/widgets/underline_gradient_indicator.dart';

var imageUrl =
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80';

class CreatorsProfile extends StatefulWidget {
  @override
  _CreatorsProfileState createState() => _CreatorsProfileState();
}

class _CreatorsProfileState extends State<CreatorsProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              floating: false,
              pinned: true,
              backgroundColor: secondaryColor,
              title: Text(
                'jayden624',
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
                          _avatarWidget(),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Jayden Massey',
                                  style: bold20White,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    'Creator',
                                    style: normal16Hint,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      GradientOutlineButton(
                                        icon: SvgPicture.asset(
                                            'assets/ic_donate.svg'),
                                        onPressed: () {},
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
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
                          'Jayden Messey provides an extremely accessible and user-friendly guide to meditation...',
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
                                '1.4k',
                                style: bold20White,
                              ),
                              Text('Followers', style: normal16Hint)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '1.4k',
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
                    Tab(icon: SvgPicture.asset('assets/ic_broadcasting.svg')),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            CreatorAudio(),
            CreatorChat(),
            CreatorBroadcast(),
          ],
        ),
      ),
    );
  }

  _avatarWidget() {
    return Stack(
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
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
//        Positioned(
//          bottom: 0.0,
//          left: 0,
//          right: 0,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                width: 50,
//                height: 20,
//                decoration: BoxDecoration(
//                  gradient: primaryGradient,
//                  borderRadius: BorderRadius.circular(50.0),
//                ),
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(right: 4.0),
//                      child: CircleAvatar(
//                        radius: 4,
//                        backgroundColor: Colors.white,
//                      ),
//                    ),
//                    Text(
//                      'Live',
//                      style: normal12White,
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//        )
      ],
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
